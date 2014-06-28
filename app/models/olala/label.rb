require_dependency Olala::Engine.root.join('app', 'models', 'olala', File.basename(__FILE__)).to_s

module Olala
  class Label
    def self.find_or_create_by_label label
      self.where(label: label).first || create(label: label)
    end
  end
end