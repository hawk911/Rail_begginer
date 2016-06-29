class ComfortCarriage < Carriage

validates :count_up, :count_down, presence: true
end
