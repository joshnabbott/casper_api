module CasperApi
  class Computers
    URI                    = '/computers'
    PLURAL_RESOURCE_NAME   = 'computers'
    SINGULAR_RESOURCE_NAME = 'computer'

    attr_accessor :uri, :connection

    def initialize(connection)
      @connection = connection
      @uri        = URI
    end

    def all
      self.get_all
    end

    def find(name_or_id)
      self.find_by_name_or_id(name_or_id)
    end

    protected
      def get_all
        response = self.connection.get(self.uri)

        if response.code.to_s =~ /^2\d+$/
          response.parsed_response[PLURAL_RESOURCE_NAME][SINGULAR_RESOURCE_NAME].inject(List.new) do |list, attributes|
            list << ListItem.new(attributes)
            list
          end
        else
          raise response.to_s
        end
      end

      def find_by_id(id)
        response = self.connection.get([self.uri, 'id', id].join('/'))

        if response.code.to_s =~ /^2\d+$/
          Computer.new(response.parsed_response[SINGULAR_RESOURCE_NAME])
        else
          raise response.to_s
        end
      end

      def find_by_name(name)
        name     = ::CGI::escape(name)
        response = self.connection.get([self.uri, 'name', name].join('/'))

        if response.code.to_s =~ /^2\d+$/
          Computer.new(response.parsed_response[SINGULAR_RESOURCE_NAME])
        else
          raise response.to_s
        end
      end

      def find_by_name_or_id(name_or_id)
        case name_or_id.to_i
        when 0
          self.find_by_name(name_or_id)
        else
          self.find_by_id(name_or_id)
        end
      end
  end
end
