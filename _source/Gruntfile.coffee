

_ = require 'lodash'

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'
module.exports = (grunt) ->

  # show elapsed time at the end
  require("time-grunt") grunt

  # load all grunt tasks
  require("load-grunt-tasks") grunt

  # Environment Configuration
  aws = grunt.file.readJSON '.aws.json'

  cfg = {}
  cfg.s3Files = [
    {
      action: 'upload'
      differential: true # only upload files that aren't on the server
      expand: true
      cwd: 'dist'
      src: [ '**' ]
      dest: ''
      params: CacheControl: 'public,max-age=600' # 10 minutes
    }
  ]



  grunt.initConfig
    cfg: cfg

    open:
      site:
        path: "http://localhost:4000"

    aws_s3:
      options:
        accessKeyId: aws.key
        secretAccessKey: aws.secret
        region: aws.region
        bucket: aws.bucket
        uploadConcurrency: 5
        downloadConcurrency: 5
      deploy:
        files: cfg.s3Files

    shell:
      jekyllBuild:
        command: 'cd app && jekyll build'
      jekyllWatch:
        command: 'cd app && jekyll serve --watch'



  # --------------------------------------------------------- Task Definitions


  # Summary/shortcut Tasks
  grunt.registerTask 'dev',       [ 'open', 'shell:jekyllWatch' ]
  grunt.registerTask 'build',     [ 'shell:jekyllBuild' ]
  grunt.registerTask "deploy",    [ 'build', 'aws_s3' ]

  # Default
  grunt.registerTask "default", [ 'dev' ]



