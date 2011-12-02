package com.gisinc.showcase.multiscreen.pm
{
	import com.esri.ags.Map;
	import com.esri.ags.events.MapMouseEvent;
	import com.esri.ags.geometry.Extent;
	import com.gisinc.showcase.multiscreen.event.MappingEvent;
	
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;

	public class MapPM
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;	
		
		[Bindable][Inject("mapModel.extent", bind="true", twoWay="true")]
		public var extent:Extent;
		
		[Bindable][Inject("mapModel.layers", bind="true")]
		public var layers:ArrayCollection;
		
		public function MapPM()
		{			
		}
		
		public function registerMap(map:Map):void
		{
			var e:MappingEvent = new MappingEvent(MappingEvent.REGISTER_MAP_OBJECT);
			e.map = map;
			dispatcher.dispatchEvent(e);
		}
		
		public function handleIdentifyParcelButtonClick(event:MouseEvent):void
		{
			dispatcher.dispatchEvent(new MappingEvent(MappingEvent.ENABLE_IDENTIFY));
		}
	}	
}