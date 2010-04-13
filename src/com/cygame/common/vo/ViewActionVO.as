package com.cygame.common.vo
{
	public class ViewActionVO
	{
		private var  _typeName:String;
		private var  _cls:Class;
		
		/**
		 * 
		 * @param name	存在ViewFactory中间的组件名称	 
		 * @param cls	组件的类
		 * 
		 */		
		public function ViewActionVO(name:String = null, cls:Class = null)
		{
			this._typeName = name;
			this._cls = cls;
		}

		public function get typeName():String
		{
			return _typeName;
		}

		public function set typeName(value:String):void
		{
			_typeName = value;
		}

		public function get cls():Class
		{
			return _cls;
		}

		public function set cls(value:Class):void
		{
			_cls = value;
		}

	}
}
