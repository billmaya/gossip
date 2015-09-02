using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	public partial class OptionsViewController : UIViewController
	{
		private OptionsView optionsView;

		public SplashScreenViewController ssvc;
		public static MainViewController mvc;

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public OptionsViewController ()
			: base (UserInterfaceIdiomIsPhone ? "OptionsViewController_iPhone" : "OptionsViewController_iPad", null)
		{
			Story.Characters = 4;

			optionsView = (OptionsView)this.View;
			optionsView.ovc = this;
		}

		public void ShowMainScreen()
		{
			if (mvc == null) {
				mvc = new MainViewController();
				mvc.ovc = this;
			}

			if (Story.Restart)
				mvc.InitializeGame();

			this.PresentViewController(mvc, false, null);
		}

		internal void RestartGame()
		{
			this.DismissViewController(false, null);
			ssvc.RestartGame();
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

