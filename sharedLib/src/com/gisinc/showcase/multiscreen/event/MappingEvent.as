package com.gisinc.showcase.multiscreen.event
{
	import com.esri.ags.Graphic;
	import com.esri.ags.Map;
	import com.esri.ags.geometry.MapPoint;
	
	import flash.events.Event;
	
	public class MappingEvent extends Event
	{
		public static const MAP_CLICK:String = "mapClick";
		public static const PARCEL_DETAILS_LOADED:String = "parcelDetailsLoaded";
		public static const ENABLE_IDENTIFY:String = "enableIdentify";
		public static const REGISTER_MAP_OBJECT:String = "registerMapObject";
		public static const HIDE_INFO_WINDOW:String = "hideInfoWindow";
		public static const ADD_INFO_GRAPHIC:String = "addInfoGraphic";
		
		public var mapPoint:MapPoint;
		public var graphic:Graphic;
		public var map:Map;
		
		public function MappingEvent(type:String, mapPoint:MapPoint=null, graphic:Graphic=null, map:Map=null)
		{
			super(type, true);
			
			this.mapPoint = mapPoint;
			this.graphic = graphic;
			this.map = map;
		}		
	}
}