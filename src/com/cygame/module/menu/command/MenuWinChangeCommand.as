package com.cygame.module.menu.command
{
	import com.cygame.common.manager.ViewFactory;
	import com.cygame.common.vo.ViewActionVO;
	import com.cygame.module.menu.view.MenuWinContainer;
	import com.cygame.module.menu.vo.MenuWinActionVO;
	import com.cygame.persist.MenuWinType;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import testCanvas.BlackCanvas;
	import testCanvas.RedCanvas;
	import testCanvas.WhiteCavas;
	
	
	/**
	 * 
	 * 专门处理窗口的弹出事件
	 * @author r.c
	 * 
	 */	
	public class MenuWinChangeCommand extends SimpleCommand
	{
		public function MenuWinChangeCommand()
		{
			super();
		}
		
		private var __viewFactory:ViewFactory = ViewFactory.getInstance();
		private var __viewActionVO:ViewActionVO = new ViewActionVO();
		
		override public function execute(notification:INotification):void{
			var menuwinaction:MenuWinActionVO = notification.getBody() as MenuWinActionVO;
			
			var typeName:String = menuwinaction.menuWinTypeName;
			__viewActionVO.typeName = typeName;
			
			switch(menuwinaction.status)
			{
				case MenuWinActionVO.CLOSE_ALL:
					//关闭所有 窗口
					CloseAllMenuWinHandle();
					break;
				case MenuWinActionVO.OPEN:
					//打开窗口
					OpenMenuWinHandle(__viewActionVO);
					break;
				case MenuWinActionVO.CLOSE:
					//关闭窗口
					CloseMenuWinHandle(__viewActionVO);
					break;
			}
		}
		
		public function OpenMenuWinHandle(action:ViewActionVO):void
		{
			var view:Object = getMenuWinByTypeName(action.typeName);
			sendNotification(MenuWinContainer.MENU_WIN_ADD , view);
			
		}
		
		public function CloseMenuWinHandle(action:ViewActionVO):void
		{
			var view:Object = getMenuWinByTypeName(action.typeName);
			sendNotification(MenuWinContainer.MENU_WIN_REMOVE , view);
		}
		
		public function CloseAllMenuWinHandle():void
		{
			sendNotification(MenuWinContainer.MENU_WIN_REMOVE_ALL);
		}
		
		public function getMenuWinByTypeName(name:String):Object{
			var view:Object;
			
			switch(name){
				case MenuWinType.RED:
					__viewActionVO.cls = RedCanvas;
					view = __viewFactory.getView(__viewActionVO);
					break;
				case MenuWinType.BLACK:
					__viewActionVO.cls = BlackCanvas;
					view = __viewFactory.getView(__viewActionVO);
					break;
				case MenuWinType.WHITE:
					__viewActionVO.cls = WhiteCavas;
					view = __viewFactory.getView(__viewActionVO);
					break;
			}
			return view;
		}
		
	}
}