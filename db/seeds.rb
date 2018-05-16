states =  [
  {
    "active": true,
    "name": "Rainbow",
    "mode": "transition",
    "color": "0xff0000",
    "brightness": 0.75
  },
  {
    "active": false,
    "name": "Lounge",
    "mode": "responsive",
    "color": "0x8138f7",
    "brightness": 1.00
  },
  {
    "active": false,
    "name": "Wake up",
    "mode": "pulse",
    "color": "0xffa100",
    "brightness": 0.30
  }
]


State.destroy_all

states.each do |x|
  State.create!(
    active: x[:active],
    name: x[:name],
    mode: x[:mode],
    color: x[:color],
    brightness: x[:brightness]
  )
end
