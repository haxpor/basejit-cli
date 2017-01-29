# basejit-cli
Command-line interface for [basejit](https://github.com/haxpor/basejit)

It will do the following works setting up project ready for NodeJS development that could be published on NPM.

* Grab the latest source files of [basejit](https://github.com/haxpor/basejit) from Github
* Unzip the downloaded .zip file and put all of its content files into current directory that executed script is operating.
* Replace all texts as appeared in basejit for your specified argument of project name and exported project name.
* Clean up un-needed files after processing
* Do `npm install`

# Pre-requisite

The script needs the following command line programs to be installed on your machine

* curl
* unzip
* sed
* find
* npm

# How to Use

* Execute `curl -s https://raw.githubusercontent.com/haxpor/basejit-cli/master/basejit-cli.sh | bash -s myLib MyLib` then it will do all the work for you.  
   * Note that `myLib` is your project name, and `MyLib` is your exported name of the project which will be used when you refer it in code.
* Execute `npm test` to test the project set up. You should see all tests are passed.
* Start your project development.
   * Start thing off via `./src/core/core.js` and `./src/core/core.util.js`. Those files have some minimal code, modify it freely.
   * There are already initial testing code in `./test/_core.test.js` and `./test/mockContext.js`. Modify it freely.
   * `package.json` can be freely modified to match your package information to be ready for publish later.

# More information?

If you need more information, see [basejit](https://github.com/haxpor/basejit) project for more information of what it can do and offers.
