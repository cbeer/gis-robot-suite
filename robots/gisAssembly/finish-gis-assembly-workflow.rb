require 'fileutils'

# Robot class to run under multiplexing infrastructure
module Robots       # Robot package
  module DorRepo    # Use DorRepo/SdrRepo to avoid name collision with Dor module
    module GisAssembly   # This is your workflow package name (using CamelCase)

      class FinishGisAssemblyWorkflow # This is your robot name (using CamelCase)
        # Build off the base robot implementation which implements
        # features common to all robots
        include LyberCore::Robot 

        def initialize
          super('dor', 'gisAssemblyWF', 'finish-gis-assembly-workflow', check_queued_status: true) # init LyberCore::Robot
        end

        # `perform` is the main entry point for the robot. This is where
        # all of the robot's work is done.
        #
        # @param [String] druid -- the Druid identifier for the object to process
        def perform(druid)
          LyberCore::Log.debug "finish-gis-assembly-workflow working on #{druid}"
          rootdir = GisRobotSuite.locate_druid_path druid, type: :stage          
          
          # first ensure all files are ready
          %w{
            content/data.zip
            content/data_EPSG_4326.zip
            content/preview.jpg
            metadata/contentMetadata.xml
            metadata/descMetadata.xml
            metadata/geoMetadata.xml
          }.each do |fn|
            raise RuntimeError, "Missing required file: #{fn}" unless File.exists?("#{rootdir}/#{fn}")
          end
          
          # delete all staged files in temp/
          tmpdir = "#{rootdir}/temp"
          if File.directory?(tmpdir)
            LyberCore::Log.debug "finish-gis-assembly-workflow deleting #{tmpdir}"
            FileUtils.rm_r(tmpdir) 
          end
          
          # load workspace with identical copy of stage
          destdir = GisRobotSuite.locate_druid_path druid, type: :workspace
          FileUtils.mkdir_p(destdir) unless File.directory?(destdir)
          LyberCore::Log.info "finish-gis-assembly-workflow migrating object to #{destdir}"
          system("rsync -av --delete #{rootdir}/ #{destdir}/")
        end
      end

    end
  end
end
