class EconomyCarriage < Carriage

validates :count_up, :count_down, :count_side_down, :count_side_up,
presence: true
end
