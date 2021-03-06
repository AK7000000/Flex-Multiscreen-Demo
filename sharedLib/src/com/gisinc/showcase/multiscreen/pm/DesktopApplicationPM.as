package com.gisinc.showcase.multiscreen.pm
{
	import com.esri.ags.Graphic;
	import com.esri.ags.geometry.Polygon;
	import com.esri.ags.symbols.InfoSymbol;
	import com.gisinc.showcase.multiscreen.event.MappingEvent;
	import com.gisinc.showcase.multiscreen.model.MapModel;
	import com.gisinc.showcase.multiscreen.view.renderer.ParcelInfoSymbolRenderer;
	
	import flash.events.IEventDispatcher;
	
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	
	import spark.components.Application;

	public class DesktopApplicationPM
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;	

		[Inject]
		public var mapModel:MapModel;
		
		public function DesktopApplicationPM()
		{			
		}
		
		public function handleApplicationComplete(event:FlexEvent):void
		{
			var app:Application = event.currentTarget as Application;
		}
		
		[EventHandler("MappingEvent.PARCEL_DETAILS_LOADED", properties="graphic")]
		public function handleShowDetails(graphic:Graphic):void
		{
			//Create info graphic
			var infoGra:Graphic = new Graphic();  
			infoGra.geometry = (graphic.geometry as Polygon).extent.center;
			infoGra.attributes = graphic.attributes;
			
			//Create new info symbol
			var isymbol:InfoSymbol = new InfoSymbol();  
			isymbol.containerStyleName = "infoSymbolWindow";
			isymbol.infoRenderer = new ClassFactory(ParcelInfoSymbolRenderer);
			
			infoGra.symbol = isymbol;
			
			var e:MappingEvent = new MappingEvent(MappingEvent.ADD_INFO_GRAPHIC);
			e.graphic = infoGra;
			dispatcher.dispatchEvent(e);
		}
	}	
}