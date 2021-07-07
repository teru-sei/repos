class Purpose < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'コーヒー' },
    { id: 3, name: '紅茶' },
    { id: 4, name: 'スイーツ' },
    { id: 5, name: 'オシャレ' }
  ]

  include ActiveHash::Associations
  has_many :cafes
end
