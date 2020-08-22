#!/usr/bin/python2

import sys, os.path
from sys import argv
from os import system, remove
from string import *
from subr import *
import grid

global train, pass_through_options
global labels, features

svmtrain_exe = '/usr/local/bin/svm-tools/svm-train'
svmpredict_exe = '/usr/local/bin/svm-tools/svm-predict'
models_path = '/usr/local/share/nemea/device_classifier'

# process command line options, set global parameters
def process_options(argv = sys.argv):
	global train, pass_through_options

	if len(argv) < 2:
		print "Usage: %s [parameters for svm-train] training_file" % argv[0]
		sys.exit(1)

	train = argv[-1]

	assert os.path.exists(train), "training_file not found."

	pass_through_options = join(argv[1:len(argv)-2], " ")

def read_problem(file):
	assert os.path.exists(file), "%s not found." % (file)

	_labels = []
	_features = []

	in_file = open(file, "r")
	for line in in_file:
		spline = split(line)
		if spline[0].find(':') == -1:
			_labels.append(split(spline[0], ','))
			_features.append(join(spline[1:]))
		else:
			_labels.append([])
			_features.append(join(spline))
	in_file.close()

	return (_labels, _features)

def count_labels(labels):
	_labels = []

	for i in range(len(labels)):
		for lab in labels[i]:
			if (lab not in _labels):
				_labels.append(lab)

	return _labels

# Give me a label
def build_problem(lab):
	# build binary classification problem for label lab
	problem = open("/tmp/tmp_binary", "w")

	for t in range(len(labels)):
		if lab in labels[t]:
			problem.write("+1 %s\n" % features[t])
		else:
			problem.write("-1 %s\n" % features[t])

	problem.close()

def train_problem(lab):
	global pass_through_options
	print "Training problem for label %s..." % lab

	rate, param = grid.find_parameters("/tmp/tmp_binary", "")

	pass_through_options = "-c %f -g %f" % (param['c'], param['g'])
	print pass_through_options

	cmd = "%s %s %s %s" % (svmtrain_exe, pass_through_options, "/tmp/tmp_binary", "%s/%s" % (models_path, lab))
	os.system(cmd)

def main():
	global train, labels, features

	process_options()

	# read problem and get all labels
	(labels, features) = read_problem(train)
	all_labels = count_labels(labels)


	for i in range(len(all_labels)):
		# train binary problem for the label all_labels[i]
		lab = all_labels[i] 

		build_problem(lab)
		train_problem(lab)

main()
