using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	public partial class TipsViewController : UIViewController
	{
		private TipsView tipsView;

		internal MainViewController mvc;

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public TipsViewController ()
			: base (UserInterfaceIdiomIsPhone ? "TipsViewController_iPhone" : "TipsViewController_iPad", null)
		{
			tipsView = (TipsView)this.View;
			tipsView.tvc = this;
		}

		public void ShowMainScreen()
		{
			this.DismissViewController(false, null);
		}

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			
			// Perform any additional setup after loading the view, typically from a nib.
		}
	}
}

