module CasperApi
  class Casper
    attr_accessor :connection

    def initialize(username, password)
      @username   = username
      @password   = password
      @connection = Connection.new(@username, @password)
    end

    def buildings
      @buildings ||= Buildings.new(self.connection)
    end

    def categories
      @categories ||= Categories.new(self.connection)
    end

    def computer_groups
      @computer_groups ||= ComputerGroups.new(self.connection)
    end

    def computers
      @computers ||= Computers.new(self.connection)
    end

    def departments
      @departments ||= Departments.new(self.connection)
    end

    def mobile_devices
      @mobile_devices ||= MobileDevices.new(self.connection)
    end
  end
end
