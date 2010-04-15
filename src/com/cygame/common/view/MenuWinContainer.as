package com.cygame.common.view
{
	import com.cygame.common.interfaces.IWinCanvas;
	import com.cygame.facade.ApplicationFacade;
	import com.cygame.common.mediator.MenuWinContainerMediator;
	
	import flash.display.DisplayObject;
	
	import mx.containers.Canvas;
	
	/**
	 * 
	 * 存放所有弹出窗口 或面板
	 * @author r.c
	 * 
	 */	
	public class MenuWinContainer extends Canvas
	{
		public static var MENU_WIN_ADD:String = "menuwinadd";
		public static var MENU_WIN_REMOVE:String = "menuwinremove";
		public static var MENU_WIN_REMOVE_ALL:String = "menuwinremoveall";
		public static var MENU_WIN_SET_INDEX:String = "menuwinsetindex";
		
		public function MenuWinContainer()
		{
			super();
			this.horizontalScrollPolicy = "off";
			this.verticalScrollPolicy = "off";
			ApplicationFacade.getInstance().registerMediator(new MenuWinContainerMediator(this));
		}
		
		/**
		 * 存在设置最顶层，不存在添加上来  
		 * @param child
		 * @return 
		 * 
		 */		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			if(contains(child)){
				
				setChildIndex(child, numChildren - 1);
				if(child.visible == false){
					child.visible = true;
					child.x = (this.width - child.width)/2;
					child.y = (this.height - child.height)/2;
					if(child is IWinCanvas){
						(child as IWinCanvas).show(true);
					}
				}
				
			}else{
				super.addChild(child);
				child.x = (this.width - child.width)/2;
				child.y = (this.height - child.height)/2;
				
				if(child is IWinCanvas){
					(child as IWinCanvas).show(true);
				}
			}
			
			return child;
		}
		/**
		 * 隐藏某个面板
		 * @param child
		 * @return DisplayObject
		 * 
		 */		
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			if(!contains(child))	return child;
			child.visible = false;
			if(child is IWinCanvas){
				(child as IWinCanvas).show(false);
			}
			return child;
		}
		
		/**
		 * 
		 * 隐藏所有 面版
		 */		
		override public function removeAllChildren():void
		{
			var children:Array = getChildren();
			var lng:int = children.length;
			for(var i:int = 0; i<lng ;i++){
				var item:DisplayObject = children[i];
				item.visible = false;
				if(item is IWinCanvas){
					(item as IWinCanvas).show(false);
				}
			}
		}
	}
}