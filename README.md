# jakhu-runner
Vagrant box provisioner and web-app runner for jakhu.js

# Setup
To get started, we need some enviroment vars for knowing about the worker.
Do the following:
  * `export JAKHU_WORKER_NAME=<name of the worker you are using>`
  * `export JAKHU_APP_NAME=<name of the web-app you want to run>`
  * `export JAKHU_APP_DIR=<absolute dir where the web-app you want to run is located>`

For example:
  * `export JAKHU_WORKER_NAME=foobar`
  * `export JAKHU_APP_NAME=foo`
  * `export JAKHU_APP_DIR=$PWD/bar`

Then, to get started, run `bin/jakhurun start`

# Using our Vagrant box
  * `vagrant up && vagrant ssh`

Then, in the vagrant shell:
  * `source /vagrant/vagrantvars.sh && /vagrant/bin/jakhurun start`
