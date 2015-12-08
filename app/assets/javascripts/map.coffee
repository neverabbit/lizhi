# 百度地图API功能
map = new (BMap.Map)('maptool')
# 创建Map实例
map.centerAndZoom new (BMap.Point)(121.48023, 31.23634), 11
# 初始化地图,设置中心点坐标和地图级别
# map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
# alert 1
# alert position.city
map.setCurrentCity position.city
# 设置地图显示的城市 此项是必须设置的
map.enableScrollWheelZoom true
#开启鼠标滚轮缩放
myGeo = new (BMap.Geocoder)
# 将地址解析结果显示在地图上，并调整地图视野    
myGeo.getPoint position.address, ((point) ->
  if point
    map.centerAndZoom point, 14
    map.addOverlay new (BMap.Marker)(point)
  return
), position.city
# var transit = new BMap.TransitRoute(map, {
# 				  renderOptions: {map: map, panel: "results"}
# 				  });
# 				transit.search("江苏路地铁站", "民生路1199弄");
# var start = "江苏路地铁站";
end = position.city + position.address
$('#transit_result').click ->
  map.clearOverlays()
  start = $('#start_point').val()
  transit = new (BMap.TransitRoute)(map,
    renderOptions:
      map: map
      panel: 'r-result'
      autoViewport: true
    policy: BMAP_TRANSIT_POLICY_LEAST_TIME)
  transit.search start, end
  return
$('#driving_result').click ->
  map.clearOverlays()
  start = $('#start_point').val()
  driving = new (BMap.DrivingRoute)(map,
    renderOptions:
      map: map
      panel: 'r-result'
      autoViewport: true
    policy: BMAP_DRIVING_POLICY_LEAST_TIME)
  driving.search start, end
  return

# ---
# generated by js2coffee 2.1.0