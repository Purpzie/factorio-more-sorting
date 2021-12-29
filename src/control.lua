local inv_list = {
	car = {defines.inventory.car_trunk},
	["cargo-wagon"] = {defines.inventory.cargo_wagon},
	container = {defines.inventory.chest},
	["logistic-container"] = {defines.inventory.chest},
	roboport = {defines.inventory.roboport_robot, defines.inventory.roboport_material},
	["spider-vehicle"] = {defines.inventory.spider_trunk}
}

script.on_event(defines.events.on_gui_opened, function(event)
	if event.entity == nil then return end
	local invs = inv_list[event.entity.type]
	if invs == nil then return end

	local get_inv = event.entity.get_inventory
	for _, inv_index in ipairs(invs) do
		get_inv(inv_index).sort_and_merge()
	end
end)
