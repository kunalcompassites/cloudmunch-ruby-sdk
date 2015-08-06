#!/usr/bin/ruby

require 'net/http'
require 'cgi'


module CloudmunchService

    def self.getCustomDataContext(server, endpoint, params)
        return self.http_get(server, endpoint, params)
    end

    def self.updateCustomDataContext(server, endpoint, params)
        return self.http_post(server, endpoint, params)
    end

    def self.http_get(server,path,params)
        if params.nil?
            return Net::HTTP.get(server, path)
        else
            queryStr =  "#{path}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&'))
            puts queryStr
            uri = URI(server + "/" + queryStr)
            return Net::HTTP.get(uri)
        end
    end

    def self.http_post(server,path,params)
        if params.nil?
            return Net::HTTP.post(server, path)
        else
            uri = URI(server + "/" + path)
            return Net::HTTP.post_form(uri, params)
        end
    end

    def self.getDataContext(server, endpoint, param)
        getCustomDataContext(server, endpoint, param)
    end

    def self.updateDataContext(server, endpoint, param)
        updateCustomDataContext(server, endpoint, param)
    end
end
