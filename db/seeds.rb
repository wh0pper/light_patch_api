states =  [
  {
    "active": true,
    "mode": "color_wheel",
    "color": "red",
    "brightness": 0.7
  },
  {
    "active": false,
    "mode": "responsive",
    "color": "purple",
    "brightness": 1.0
  },
  {
    "active": false,
    "mode": "wake-up",
    "color": "orange",
    "brightness": 0.3
  }
]


State.destroy_all

states.each do |x|
  State.create!(
    active: x[:active],
    mode: x[:mode],
    color: x[:color],
    brightness: x[:brightness]
  )
end
