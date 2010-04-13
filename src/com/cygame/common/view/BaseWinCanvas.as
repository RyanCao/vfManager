package com.cygame.common.view
{
	import com.cygame.common.interfaces.IWinCanvas;
	
	import mx.containers.Canvas;
	
	public class BaseWinCanvas extends Canvas implements IWinCanvas
	{
		public function BaseWinCanvas()
		{
			super();
		}
		
		public function show(value:Boolean):void
		{
			//数据 监听
		}
	}
}