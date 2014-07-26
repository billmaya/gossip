using System;
using System.Drawing;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	public partial class SplashScreenViewController : UIViewController
	{
		private SplashScreenView splashScreenView;
		private NSTimer delayTimer;

//		internal MainViewController mvc;

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}

		public SplashScreenViewController()
			: base (UserInterfaceIdiomIsPhone ? "SplashScreenViewController_iPhone" : "SplashScreenViewController_iPad", null)
		{
			splashScreenView = (SplashScreenView)this.View;
			splashScreenView.ssvc = this;

			delayTimer = NSTimer.CreateScheduledTimer(5.0, delegate {
				ShowOptionsScreen();
			});
		}

		internal void RestartGame()
		{
			splashScreenView.SetNeedsDisplay();
			delayTimer = NSTimer.CreateScheduledTimer(5.0, delegate {
				ShowOptionsScreen();
			});
		}

		private void ShowOptionsScreen()
		{
			OptionsViewController ovc = new OptionsViewController();
			ovc.ssvc = this;

			this.PresentViewController(ovc, false, null);
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
	}
}

