class Parser::SmartRich::Pages::UrlGrabber < Parser::Pages::FileType::UrlsFileParser

  protected

    def matcher_field(property_node)
      parsed = parser_class.new(property_node)
      parsed.external_link
    end

    def parser_class
      Parser::SmartRich::Attributes::PropertyAttributes
    end

    def property_node?(node)
      node.name == 'object'
    end
end
