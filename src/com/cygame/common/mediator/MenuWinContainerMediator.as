package com.cygame.common.mediator
{
	import com.cygame.common.view.MenuWinContainer;
	
	import mx.core.UIComponent;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * 
	 * @author r.c
	 * 
	 */	
	public class MenuWinContainerMediator extends Mediator
	{
		public static var NAME:String = "menuWinContainerMediator";
		
		public function MenuWinContainerMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function get view():MenuWinContainer
		{
			return viewComponent as MenuWinContainer;
		}
		
		override public function listNotificationInterests():Array{
			return [MenuWinContainer.MENU_WIN_ADD,MenuWinContainer.MENU_WIN_REMOVE,MenuWinContainer.MENU_WIN_REMOVE_ALL];
		}
		
		override public function handleNotification(notification:INotification):void{
			var type:String = notification.getName();
			switch(type){
				case MenuWinContainer.MENU_WIN_ADD:
					view.addChild(notification.getBody() as UIComponent);
					break;
				case MenuWinContainer.MENU_WIN_REMOVE:
					view.removeChild(notification.getBody() as UIComponent);
					break;
				case MenuWinContainer.MENU_WIN_REMOVE_ALL:
					view.removeAllChildren();
					break;
			} 
		}
		
	}
}