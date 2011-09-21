class Navigation

  class ElementStyle
    attr_accessor :selected, :type
    def initialize(type = "filter",selected = false)
      @selected, @type = selected, type
    end
  end

  def initialize(selected = "Development")
    @selected = selected
  end

  def elements
    subjects = Subject.roots
    elements = {}
    subjects.each do |subject|
      elements[subject.name] = ElementStyle.new("page")
      subject.children.each do |child|
        elements[child.name] = ElementStyle.new("filter")
      end
    end
    elements[@selected].selected = true
    elements
  end
    # elements = {
    #   "Development"   => ElementStyle.new("page"),
    #   "Features"      => ElementStyle.new("filter"),
    #   "Bugs"          => ElementStyle.new("filter"),
    #   "Design"        => ElementStyle.new("filter"),
    #   "Projects"      => ElementStyle.new("page"),
    #   "Active Metric" => ElementStyle.new("filter"),
    #   "Ranges"        => ElementStyle.new("filter"),
    #   "Things"        => ElementStyle.new("filter"),
    #   "Authors"       => ElementStyle.new("page")
    # }
    # elements[@selected].selected = true
    # elements

end