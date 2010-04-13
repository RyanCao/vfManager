package com.cygame.facade
{

	import com.cygame.module.menu.command.MenuWinChangeCommand;
	import com.cygame.persist.NotificationConst;
	
	import org.puremvc.as3.patterns.facade.Facade;

	public class ApplicationFacade extends Facade
	{
		public static function getInstance():ApplicationFacade
		{
			if (instance == null)
			{
				instance=new ApplicationFacade();
			}
			return instance as ApplicationFacade;
		}
		private var _started:Boolean=false;

		//初始化InitCommand
		//preLoad to do something.
		public function startUp(app:Object):void
		{
			_started=true;

		}

		public function get isStarted():Boolean
		{
			return this._started;
		}

		//init controllers
		//regist some commands
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand(NotificationConst.MENU_WIN_CHANGE, MenuWinChangeCommand);
		}
	}
}