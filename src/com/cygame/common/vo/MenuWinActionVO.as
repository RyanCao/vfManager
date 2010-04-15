package com.cygame.common.vo
{
	public class MenuWinActionVO
	{
		public static const OPEN:String = "open";
		public static const CLOSE:String = "close";
		public static const CLOSE_ALL:String = "closeAll";
		
		public var menuWinTypeName:String;					//窗口的名称
		public var status:String = OPEN;					//窗口状态，OPEN或者CLOSE
		public var index:int;								//此窗口默认打开的序号
		public var data:Object;	
		public var view:Object;
		
		/**
		 * 
		 * @param name	     窗口的名称 					 	DEFAULT:NULL
		 * @param status  窗口状态，OPEN或者CLOSE		DEFAULT:MenuWinActionVO.OPEN
		 * @param index   此窗口默认打开的序号			DEFAULT:0
		 * 
		 */		
		public function MenuWinActionVO(name:String = null, status:String = OPEN, index:int=0)
		{
			this.menuWinTypeName = name;
			this.status = status;
			this.index = index;
		}
	}
}