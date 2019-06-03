class Monitor
  attr_accessor :resolution, :type, :contrast

  def initialize(resolution, type, contrast)
    self.resolution = resolution
    self.type = type
    self.contrast = contrast
  end
end
