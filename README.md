# boss-runner
Vagrant box provisioner and web-app runner for boss.js

# Setup
To get started, we need some enviroment vars for knowing about the worker.
Do the following:
  * `export BOSS_WORKER_NAME=<name of the worker you are using>`
  * `export BOSS_APP_NAME=<name of the web-app you want to run>`
  * `export BOSS_WEB_DIR=<absolute dir where the web-app you want to run is located>`
For example:
  * `export BOSS_WORKER_NAME=foobar`
  * `export BOSS_APP_NAME=foo`
  * `export BOSS_WEB_DIR=$PWD/bar`
Then, to get started, run `bin/bossrun`

# Deploy into a vagrant box
  * `vagrant up && vagrant ssh`
In the vagrant shell:
  * `source /vagrant/vagrantvars.sh && /vagrant/bin/bossrun start`
