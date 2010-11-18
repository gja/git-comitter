require 'rubygems'
require 'json'
require 'net/http'
require 'ftools'

class Array
  def second
    self[1]
  end
end

module GitComitter
  def cruise_is_red(args = {})
    cruise_url = args[:cruise_url]
    pipelines = args[:pipelines]
    pipelines.each_pair do |pipeline_name, stage_name|
      stage = Stage.new(cruise_url, pipeline_name, stage_name)
      return true if stage.should_not_checkin?
    end
    false
  end

  class Pipeline
    def initialize(cruise_url, pipeline)
      @pipe = pipeline
      @cruise_url = cruise_url
    end

    def status(stage)
      url = "#{@cruise_url}?pipelineName=#{@pipe}&stageName=#{stage}&perPage=2"
      urlObj = URI.parse(url)
      req = Net::HTTP::Get.new(urlObj.path + '?' + urlObj.query)
      res = Net::HTTP.start(urlObj.host, urlObj.port) {|http| http.request(req)}

      history = JSON.parse(res.body)["history"]

      status = history.first["current_status"]
      status = history.second["current_status"] if status == 'building'
      status
    end
  end

  class Stage
    def initialize(cruise_url, pipeline_name, stage_name)
      @cruise = Pipeline.new(cruise_url, pipeline_name)
      @stage_name = stage_name
    end

    def should_not_checkin?
      stage_status != 'passed' 
    end

    :private
    def stage_status
      @stage_status=@cruise.status @stage_name if @stage_status == nil
      @stage_status 
    end
  end
end

