module CasperApi
  class Computer < OpenStruct
    # Primary methods:
    # <tt>Computer#general</tt>
    # <tt>Computer#location</tt>
    # <tt>Computer#purchasing</tt>
    # <tt>Computer#peripherals</tt>
    # <tt>Computer#hardware</tt>
    # <tt>Computer#software</tt>
    # <tt>Computer#location</tt>
    # <tt>Computer#extension_attributes</tt>
    # <tt>Computer#groups_accounts</tt>
    # <tt>Computer#iphones</tt>

    attr_accessor :id

    def initialize(attributes = {})
      @id = attributes['id']

      super
    end
  end
end
