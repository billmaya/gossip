using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	public partial class HelpViewController : UIViewController
	{
		private HelpView helpView;

		internal MainViewController mvc;

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public HelpViewController()
			: base (UserInterfaceIdiomIsPhone ? "HelpViewController_iPhone" : "HelpViewController_iPad", null)
		{
			helpView = (HelpView)this.View;
			helpView.hvc = this;

		}
		public void ShowMainScreen()
		{
			this.DismissViewController(false, null);
		}

		public override void DidReceiveMemoryWarning()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning();
			
			// Release any cached data, images, etc that aren't in use.
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			
			// Perform any additional setup after loading the view, typically from a nib.
		}

		public override void ViewDidAppear(bool animated)
		{
			base.ViewDidAppear(animated);

			helpView.index = 0;
		}
	}
}

