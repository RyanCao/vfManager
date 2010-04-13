package com.cygame.common.manager
{
	import com.cygame.common.vo.ViewActionVO;
	
	import flash.utils.Dictionary;

	/**
	 * 单例,通过getView方法可以得到唯一名称的类
	 * @author r.c
	 * <p><b>e.g</b><br><code>
	 * var viewAction:ViewAction = new ViewAction("Test", Sprite);<br>
	 * var sprite:Scprite = ViewFactory.getInstance().getView(viewAction) as Sprite;</code>
	 * </p>
	 */	
	public class ViewFactory
	{
		private static var _instance:ViewFactory;
		
		private var views:Dictionary = new Dictionary();
		
		public function ViewFactory()
		{
			if(_instance != null){
				throw new Error("----ViewFactory RyanCao ---Create Error");
			}
			_instance = this;
		}
		public function getView(action:ViewActionVO):Object
		{
			var name:String = action.typeName;
			var cls:Class = action.cls;
			if(views[name] == null){
				views[name] = new cls();
			} 
			return views[name];
		}
		public static function getInstance():ViewFactory
		{
			if(_instance == null){
				_instance = new ViewFactory();
			}
			return _instance;
		}
	}
}