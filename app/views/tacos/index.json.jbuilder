json.array! @tacos do |taco|
  json.id taco.id
  json.meat taco.meat
  json.rice taco.rice
  json.salsa taco.salsa
  json.notes taco.notes
  json.coleslaw taco.coleslaw
  json.price humanized_money_with_symbol taco.price
end