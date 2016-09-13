using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("TextView")]
	public class TextView : UIView 
	{
		protected CGSize dimensions;
		protected CGPoint location;

		protected string text;
		protected float fontSize;

		protected float translationY;

		public TextView ()
		{
		}

		internal virtual void SetText(string message)
		{
			text = message;
		}

		protected void ModifyFrame()
		{
			CGRect frame = this.Frame;
			
			frame.Width = dimensions.Width;
			frame.Height = dimensions.Height;
			frame.X = location.X;
			frame.Y = location.Y;
			
			this.Frame = frame;
		}
	}
}

