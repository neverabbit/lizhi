# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

shanghai_districts = ['黄浦区', '浦东新区', '徐汇区', '长宁区', '静安区', '普陀区', '闸北区', '虹口区', '杨浦区', '闵行区', '宝山区', '嘉定区', '金山区', '松江区', '青浦区', '奉贤区', '崇明县']
beijing_districts = ['东城区', '西城区', '海淀区', '朝阳区', '丰台区', '石景山区', '通州区', '顺义区', '房山区', '大兴区', '昌平区', '怀柔区', '平谷区', '门头沟区', '密云区', '延庆区']
# shenzhen_districts = ['福田区', '罗湖区', '南山区', '盐田区', '宝安区', '龙岗区', '光明新区', '龙华新区', '坪山新区', '大鹏新区']
# guangzhou_districts = ['越秀区', '荔湾区', '海珠区', '天河区', '白云区', '黄浦区', '番禺区', '花都区', '南沙区', '增城区', '从化区']
hangzhou_districts = ['上城区', '下城区', '江干区', '拱墅区', '西湖区', '滨江区', '萧山区', '余杭区', '富阳区', '桐庐县', '淳安县', '建德市', '临安市']

# $('#position_city').val()


$('#position_city').ready ->
	$('#position_district').empty()
	city = $('#position_city').val()
	districts = switch
		when city == '上海市' then shanghai_districts
		when city == '北京市' then beijing_districts
		# when city == '深圳' then shenzhen_districts
		# when city == '广州' then guangzhou_districts
		when city == '杭州市' then hangzhou_districts
	$.each districts, (i, district) ->
		$('#position_district').append $('<option>',
			value: i,
			text: district)
$('#position_city').change ->
	$('#position_district').empty()
	city = $('#position_city').val()
	districts = switch
		when city == '上海市' then shanghai_districts
		when city == '北京市' then beijing_districts
		# when city == '深圳' then shenzhen_districts
		# when city == '广州' then guangzhou_districts
		when city == '杭州市' then hangzhou_districts
	$.each districts, (i, district) ->
		$('#position_district').append $('<option>',
			value: i,
			text: district)
	
	
	# districts = ['东城区', '西城区', '海淀区', '朝阳区', '丰台区', '石景山区', '通州区', '顺义区', '房山区', '大兴区', '昌平区', '怀柔区', '平谷区', '门头沟区', '密云区', '延庆区']
# 	$.each districts, (i, district) ->
# 		$('#position_district').append $('<option>',
# 			value: i,
# 			text: district)
	
	# $('#position_district').html('<%= escape_javascript(district_list.beijing) %>')
