#!/usr/bin/ruby
require_relative "CloudmunchService.rb"
require_relative "Util.rb"
require_relative "AppContext.rb"

class AppAbstract
    include CloudmunchService
    include Util

    @@config_path = "config/cloudmunch.json"
    @@config = nil

    @@appLevelConstant = 0
    def initialize(args)
        @domain, @project, @logfile = "", "", ""
    end

    def getDomain
        @domain
    end

    def getProject
        @project
    end

    def getLogfile
        @logfile
    end

    def getServerName
        @@masterServerName
    end

    def getServerEndpoint
        @@masterEndpoint
    end

    def self.appLevelConstant()
        return @@appLevelConstant
    end

    def logInit(logfile)
        @logger = Util.logInit(logfile)
    end

    def log(level,logString)
        Util.log(@logger, level, logString)
    end

    def logClose()
        Util.logClose(@logger)
    end

    def getJSONArgs()
        Util.getJSONArgs()
    end

    def getAppContext(param)
        appContext = AppContext.new(param)
        return appContext
    end

    def openJSONFile(fileNameWithPath)
        Util.openJSONFile(fileNameWithPath)
    end

    def generateReport(reportFilename, reportString)
        Util.generateReport(reportFilename, reportString)
    end

    def getDataContextFromCMDB(param)
        puts "getDataContextFromCMDB from AppAbstract"
        params = {
            :username => @@config['username']
        }

        params = param.merge(params)

        return CloudmunchService.getDataContext(@@config["master_url"], @@config["endpoint"], params)
    end

    def updateDataContextToCMDB(param)
        puts "updateDataContextToCMDB from AppAbstract"
        params = {
            :username => @@config['username']
        }

        params = param.merge(params)

        return CloudmunchService.updateDataContext(@@config['master_url'], @@config['endpoint'], params)
    end

    def getActiveSprint(param)
        params = {
            :username => @@config['username']
        }

        params = param.merge(params)
        Util.getActiveSprint(@@config['master_url'], @@config['endpoint'], params)
    end

    def getSortedSprints(param)
        params = {
            :username => @@config['username']
        }

        params = param.merge(params)

        Util.getSortedSprints(@@config['master_url'], @@config['endpoint'], params)
    end

    def getUrlForViewCards(param)
        params = {
            :username => @@config['username']
        }

        params = param.merge(params)

        Util.getUrlForViewCards(@@config['master_url'], @@config['endpoint'], params)
    end

    def getCMContext(context)
        begin
            return @@config[context+"_context"]
        rescue
            return false
        end
    end

    def load_config()
        @@config = openJSONFile(@@config_path)
    end

    def initializeApp()
        puts "initializeApp from AppAbstract"
    end

    def process()
        puts "process func from AppAbstract"
    end

    def cleanupApp()
        puts "cleanupApp from AppAbstract"
    end

    def start()
        load_config()
        initializeApp()
        process()
        cleanupApp()
    end

    private :load_config

end
