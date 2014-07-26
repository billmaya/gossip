#include <monotouch/monotouch.h>
#include <objc/objc.h>
#include <objc/runtime.h>
#include <UIKit/UIKit.h>


static MonoMethod *method_1 = NULL;
void *
native_to_managed_trampoline_MonoTouch_Foundation_NSObject_NSObject_Disposer__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_1)
		method_1 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_1));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_1, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_2 = NULL;
void *
native_to_managed_trampoline_MonoTouch_Foundation_NSObject_NSObject_Disposer_Drain (id this, SEL sel, id p0)
{
	void *arg_ptrs [1];
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_2)
		method_2 = get_method_for_selector ([this class], sel).method->method;
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	mono_runtime_invoke (method_2, NULL, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_3 = NULL;
void *
native_to_managed_trampoline_MonoTouch_Foundation_NSActionDispatcher_Apply (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_3)
		method_3 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_3, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_4 = NULL;
void *
native_to_managed_trampoline_Gossip_AppDelegate__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_4)
		method_4 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_4));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_4, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_5 = NULL;
void *
native_to_managed_trampoline_Gossip_AppDelegate_FinishedLaunching (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_5)
		method_5 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	void* retval = (void *) mono_runtime_invoke (method_5, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_6 = NULL;
void *
native_to_managed_trampoline_Gossip_ButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_6)
		method_6 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_6));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_6, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_7 = NULL;
void *
native_to_managed_trampoline_Gossip_ButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_7)
		method_7 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_7, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_8 = NULL;
void *
native_to_managed_trampoline_Gossip_SplashScreenView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_8)
		method_8 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_8, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_9 = NULL;
void *
native_to_managed_trampoline_Gossip_OptionsView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_9)
		method_9 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_9, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_10 = NULL;
void *
native_to_managed_trampoline_Gossip_MainView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_10)
		method_10 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_10, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_11 = NULL;
void *
native_to_managed_trampoline_Gossip_HexagonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_11)
		method_11 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_11));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_11, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_12 = NULL;
void *
native_to_managed_trampoline_Gossip_HexagonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_12)
		method_12 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_12, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_13 = NULL;
void *
native_to_managed_trampoline_Gossip_HelpView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_13)
		method_13 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_13, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_14 = NULL;
void *
native_to_managed_trampoline_Gossip_TipsViewController__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_14)
		method_14 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_14));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_14, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_15 = NULL;
void *
native_to_managed_trampoline_Gossip_TipsViewController_DidReceiveMemoryWarning (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_15)
		method_15 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_15, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_16 = NULL;
void *
native_to_managed_trampoline_Gossip_TipsViewController_ViewDidLoad (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_16)
		method_16 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_16, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_17 = NULL;
void *
native_to_managed_trampoline_Gossip_OptionsViewController__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_17)
		method_17 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_17));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_17, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_18 = NULL;
void *
native_to_managed_trampoline_Gossip_OptionsViewController_DidReceiveMemoryWarning (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_18)
		method_18 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_18, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_19 = NULL;
void *
native_to_managed_trampoline_Gossip_OptionsViewController_ViewDidLoad (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_19)
		method_19 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_19, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_20 = NULL;
void *
native_to_managed_trampoline_Gossip_MainViewController__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_20)
		method_20 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_20));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_20, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_21 = NULL;
void *
native_to_managed_trampoline_Gossip_MainViewController_DidReceiveMemoryWarning (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_21)
		method_21 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_21, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_22 = NULL;
void *
native_to_managed_trampoline_Gossip_MainViewController_ViewDidLoad (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_22)
		method_22 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_22, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_23 = NULL;
void *
native_to_managed_trampoline_Gossip_MainViewController_ViewWillAppear (id this, SEL sel, bool p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_23)
		method_23 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_23, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_24 = NULL;
void *
native_to_managed_trampoline_Gossip_MainViewController_ViewWillDisappear (id this, SEL sel, bool p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_24)
		method_24 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_24, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_25 = NULL;
void *
native_to_managed_trampoline_Gossip_MainViewController_ShouldAutorotateToInterfaceOrientation (id this, SEL sel, int p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_25)
		method_25 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	void* retval = (void *) mono_runtime_invoke (method_25, mthis, arg_ptrs, NULL);
	void * res;
	res = *(void * *) mono_object_unbox (retval);
	return res;
}

static MonoMethod *method_26 = NULL;
void *
native_to_managed_trampoline_Gossip_SplashScreenViewController__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_26)
		method_26 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_26));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_26, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_27 = NULL;
void *
native_to_managed_trampoline_Gossip_SplashScreenViewController_DidReceiveMemoryWarning (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_27)
		method_27 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_27, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_28 = NULL;
void *
native_to_managed_trampoline_Gossip_SplashScreenViewController_ViewDidLoad (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_28)
		method_28 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_28, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_29 = NULL;
void *
native_to_managed_trampoline_Gossip_CharacterView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_29)
		method_29 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_29));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_29, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_30 = NULL;
void *
native_to_managed_trampoline_Gossip_CharacterView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_30)
		method_30 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_30, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_31 = NULL;
void *
native_to_managed_trampoline_Gossip_CharacterView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_31)
		method_31 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_31, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_32 = NULL;
void *
native_to_managed_trampoline_Gossip_TextView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_32)
		method_32 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_32));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_32, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_33 = NULL;
void *
native_to_managed_trampoline_Gossip_HelpViewController__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_33)
		method_33 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_33));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_33, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_34 = NULL;
void *
native_to_managed_trampoline_Gossip_HelpViewController_DidReceiveMemoryWarning (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_34)
		method_34 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_34, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_35 = NULL;
void *
native_to_managed_trampoline_Gossip_HelpViewController_ViewDidLoad (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_35)
		method_35 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	mono_runtime_invoke (method_35, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_36 = NULL;
void *
native_to_managed_trampoline_Gossip_HelpViewController_ViewDidAppear (id this, SEL sel, bool p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_36)
		method_36 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_36, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_37 = NULL;
void *
native_to_managed_trampoline_Gossip_TipsView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_37)
		method_37 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_37, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_38 = NULL;
void *
native_to_managed_trampoline_Gossip_DownArrowButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_38)
		method_38 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_38));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_38, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_39 = NULL;
void *
native_to_managed_trampoline_Gossip_DownArrowButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_39)
		method_39 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_39, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_40 = NULL;
void *
native_to_managed_trampoline_Gossip_DownArrowButtonView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_40)
		method_40 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_40, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_41 = NULL;
void *
native_to_managed_trampoline_Gossip_DownArrowButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_41)
		method_41 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_41, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_42 = NULL;
void *
native_to_managed_trampoline_Gossip_EnterButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_42)
		method_42 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_42));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_42, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_43 = NULL;
void *
native_to_managed_trampoline_Gossip_EnterButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_43)
		method_43 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_43, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_44 = NULL;
void *
native_to_managed_trampoline_Gossip_EnterButtonView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_44)
		method_44 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_44, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_45 = NULL;
void *
native_to_managed_trampoline_Gossip_EnterButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_45)
		method_45 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_45, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_46 = NULL;
void *
native_to_managed_trampoline_Gossip_RulesButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_46)
		method_46 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_46));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_46, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_47 = NULL;
void *
native_to_managed_trampoline_Gossip_RulesButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_47)
		method_47 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_47, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_48 = NULL;
void *
native_to_managed_trampoline_Gossip_RulesButtonView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_48)
		method_48 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_48, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_49 = NULL;
void *
native_to_managed_trampoline_Gossip_RulesButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_49)
		method_49 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_49, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_50 = NULL;
void *
native_to_managed_trampoline_Gossip_TipsButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_50)
		method_50 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_50));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_50, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_51 = NULL;
void *
native_to_managed_trampoline_Gossip_TipsButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_51)
		method_51 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_51, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_52 = NULL;
void *
native_to_managed_trampoline_Gossip_TipsButtonView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_52)
		method_52 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_52, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_53 = NULL;
void *
native_to_managed_trampoline_Gossip_TipsButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_53)
		method_53 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_53, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_54 = NULL;
void *
native_to_managed_trampoline_Gossip_HardButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_54)
		method_54 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_54));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_54, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_55 = NULL;
void *
native_to_managed_trampoline_Gossip_HardButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_55)
		method_55 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_55, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_56 = NULL;
void *
native_to_managed_trampoline_Gossip_HardButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_56)
		method_56 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_56, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_57 = NULL;
void *
native_to_managed_trampoline_Gossip_MediumButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_57)
		method_57 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_57));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_57, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_58 = NULL;
void *
native_to_managed_trampoline_Gossip_MediumButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_58)
		method_58 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_58, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_59 = NULL;
void *
native_to_managed_trampoline_Gossip_MediumButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_59)
		method_59 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_59, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_60 = NULL;
void *
native_to_managed_trampoline_Gossip_EasyButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_60)
		method_60 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_60));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_60, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_61 = NULL;
void *
native_to_managed_trampoline_Gossip_EasyButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_61)
		method_61 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_61, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_62 = NULL;
void *
native_to_managed_trampoline_Gossip_EasyButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_62)
		method_62 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_62, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_63 = NULL;
void *
native_to_managed_trampoline_Gossip_SixButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_63)
		method_63 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_63));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_63, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_64 = NULL;
void *
native_to_managed_trampoline_Gossip_SixButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_64)
		method_64 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_64, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_65 = NULL;
void *
native_to_managed_trampoline_Gossip_SixButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_65)
		method_65 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_65, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_66 = NULL;
void *
native_to_managed_trampoline_Gossip_FiveButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_66)
		method_66 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_66));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_66, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_67 = NULL;
void *
native_to_managed_trampoline_Gossip_FiveButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_67)
		method_67 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_67, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_68 = NULL;
void *
native_to_managed_trampoline_Gossip_FiveButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_68)
		method_68 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_68, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_69 = NULL;
void *
native_to_managed_trampoline_Gossip_FourButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_69)
		method_69 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_69));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_69, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_70 = NULL;
void *
native_to_managed_trampoline_Gossip_FourButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_70)
		method_70 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_70, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_71 = NULL;
void *
native_to_managed_trampoline_Gossip_FourButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_71)
		method_71 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_71, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_72 = NULL;
void *
native_to_managed_trampoline_Gossip_UpArrowButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_72)
		method_72 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_72));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_72, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_73 = NULL;
void *
native_to_managed_trampoline_Gossip_UpArrowButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_73)
		method_73 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_73, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_74 = NULL;
void *
native_to_managed_trampoline_Gossip_UpArrowButtonView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_74)
		method_74 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_74, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_75 = NULL;
void *
native_to_managed_trampoline_Gossip_UpArrowButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_75)
		method_75 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_75, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_76 = NULL;
void *
native_to_managed_trampoline_Gossip_TurnView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_76)
		method_76 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_76));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_76, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_77 = NULL;
void *
native_to_managed_trampoline_Gossip_TurnView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_77)
		method_77 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_77, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_78 = NULL;
void *
native_to_managed_trampoline_Gossip_PhaseView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_78)
		method_78 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_78));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_78, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_79 = NULL;
void *
native_to_managed_trampoline_Gossip_PhaseView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_79)
		method_79 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_79, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_80 = NULL;
void *
native_to_managed_trampoline_Gossip_RightArrowHelpView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_80)
		method_80 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_80));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_80, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_81 = NULL;
void *
native_to_managed_trampoline_Gossip_RightArrowHelpView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_81)
		method_81 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_81, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_82 = NULL;
void *
native_to_managed_trampoline_Gossip_RightArrowHelpView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_82)
		method_82 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_82, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_83 = NULL;
void *
native_to_managed_trampoline_Gossip_RightArrowHelpView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_83)
		method_83 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_83, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_84 = NULL;
void *
native_to_managed_trampoline_Gossip_LeftArrowHelpView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_84)
		method_84 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_84));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_84, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_85 = NULL;
void *
native_to_managed_trampoline_Gossip_LeftArrowHelpView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_85)
		method_85 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_85, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_86 = NULL;
void *
native_to_managed_trampoline_Gossip_LeftArrowHelpView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_86)
		method_86 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_86, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_87 = NULL;
void *
native_to_managed_trampoline_Gossip_LeftArrowHelpView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_87)
		method_87 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_87, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_88 = NULL;
void *
native_to_managed_trampoline_Gossip_VersionView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_88)
		method_88 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_88));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_88, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_89 = NULL;
void *
native_to_managed_trampoline_Gossip_VersionView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_89)
		method_89 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_89, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_90 = NULL;
void *
native_to_managed_trampoline_Gossip_PlayAgainButtonView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_90)
		method_90 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_90));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_90, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_91 = NULL;
void *
native_to_managed_trampoline_Gossip_PlayAgainButtonView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_91)
		method_91 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_91, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_92 = NULL;
void *
native_to_managed_trampoline_Gossip_PlayAgainButtonView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_92)
		method_92 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_92, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_93 = NULL;
void *
native_to_managed_trampoline_Gossip_PlayAgainButtonView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_93)
		method_93 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_93, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_94 = NULL;
void *
native_to_managed_trampoline_Gossip_MessageView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_94)
		method_94 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_94));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_94, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_95 = NULL;
void *
native_to_managed_trampoline_Gossip_MessageView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_95)
		method_95 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_95, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_96 = NULL;
void *
native_to_managed_trampoline_Gossip_BaraView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_96)
		method_96 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_96));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_96, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_97 = NULL;
void *
native_to_managed_trampoline_Gossip_BaraView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_97)
		method_97 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_97, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_98 = NULL;
void *
native_to_managed_trampoline_Gossip_RightArrowOptionsView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_98)
		method_98 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_98));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_98, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_99 = NULL;
void *
native_to_managed_trampoline_Gossip_RightArrowOptionsView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_99)
		method_99 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_99, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_100 = NULL;
void *
native_to_managed_trampoline_Gossip_RightArrowOptionsView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_100)
		method_100 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_100, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_101 = NULL;
void *
native_to_managed_trampoline_Gossip_RightArrowOptionsView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_101)
		method_101 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_101, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_102 = NULL;
void *
native_to_managed_trampoline_Gossip_EllaView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_102)
		method_102 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_102));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_102, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_103 = NULL;
void *
native_to_managed_trampoline_Gossip_EllaView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_103)
		method_103 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_103, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_104 = NULL;
void *
native_to_managed_trampoline_Gossip_MaxView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_104)
		method_104 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_104));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_104, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_105 = NULL;
void *
native_to_managed_trampoline_Gossip_MaxView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_105)
		method_105 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_105, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_106 = NULL;
void *
native_to_managed_trampoline_Gossip_OwenView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_106)
		method_106 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_106));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_106, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_107 = NULL;
void *
native_to_managed_trampoline_Gossip_OwenView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_107)
		method_107 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_107, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_108 = NULL;
void *
native_to_managed_trampoline_Gossip_LeftArrowTipsView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_108)
		method_108 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_108));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_108, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_109 = NULL;
void *
native_to_managed_trampoline_Gossip_LeftArrowTipsView_Draw (id this, SEL sel, CGRect p0)
{
	void *arg_ptrs [1];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_109)
		method_109 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	arg_ptrs [0] = &p0;
	mono_runtime_invoke (method_109, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_110 = NULL;
void *
native_to_managed_trampoline_Gossip_LeftArrowTipsView_TouchesBegan (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_110)
		method_110 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_110, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_111 = NULL;
void *
native_to_managed_trampoline_Gossip_LeftArrowTipsView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_111)
		method_111 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_111, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_112 = NULL;
void *
native_to_managed_trampoline_Gossip_ZoeView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_112)
		method_112 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_112));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_112, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_113 = NULL;
void *
native_to_managed_trampoline_Gossip_ZoeView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_113)
		method_113 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_113, mthis, arg_ptrs, NULL);
	return NULL;
}

static MonoMethod *method_114 = NULL;
void *
native_to_managed_trampoline_Gossip_MortView__ctor (id this, SEL sel)
{
	void *arg_ptrs [0];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (monotouch_try_get_nsobject (this))
		return this;
	if (!method_114)
		method_114 = get_method_for_selector ([this class], sel).method->method;
	int handle = (int) this;
	handle |= 1;
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (method_114));
	mono_field_set_value (mthis, monotouch_nsobject_handle_field, &handle);
	mono_runtime_invoke (method_114, mthis, arg_ptrs, NULL);
	monotouch_create_managed_ref (this, mthis, true);
	void *params[2];
	params[0] = mthis;
	params[1] = &this;
	mono_runtime_invoke (monotouch_register_nsobject, NULL, params, NULL);
	return this;
}

static MonoMethod *method_115 = NULL;
void *
native_to_managed_trampoline_Gossip_MortView_TouchesEnded (id this, SEL sel, id p0, id p1)
{
	void *arg_ptrs [2];
	MonoObject *mthis;
	if (mono_domain_get () == NULL)
		mono_jit_thread_attach (NULL);
	if (!method_115)
		method_115 = get_method_for_selector ([this class], sel).method->method;
		mthis = NULL;
		if (this) {
			mthis = get_managed_object_for_ptr_fast (this, true);
		}
	NSObject *nsobj0 = (NSObject *) p0;
		MonoObject *mobj0 = NULL;
		if (nsobj0) {
			mobj0 = get_managed_object_for_ptr_fast (nsobj0, true);
		}
		arg_ptrs [0] = mobj0;
	NSObject *nsobj1 = (NSObject *) p1;
		MonoObject *mobj1 = NULL;
		if (nsobj1) {
			mobj1 = get_managed_object_for_ptr_fast (nsobj1, true);
		}
		arg_ptrs [1] = mobj1;
	mono_runtime_invoke (method_115, mthis, arg_ptrs, NULL);
	return NULL;
}



static MTClassMap __monotouch_class_map [] = {
	{"NSObject", "MonoTouch.Foundation.NSObject, monotouch", 0},
	{"NSException", "MonoTouch.Foundation.NSException, monotouch", 0},
	{"NSBundle", "MonoTouch.Foundation.NSBundle, monotouch", 0},
	{"NSArray", "MonoTouch.Foundation.NSArray, monotouch", 0},
	{"AVAudioPlayer", "MonoTouch.AVFoundation.AVAudioPlayer, monotouch", 0},
	{"UIScreen", "MonoTouch.UIKit.UIScreen, monotouch", 0},
	{"UIResponder", "MonoTouch.UIKit.UIResponder, monotouch", 0},
	{"UIImage", "MonoTouch.UIKit.UIImage, monotouch", 0},
	{"UIEvent", "MonoTouch.UIKit.UIEvent, monotouch", 0},
	{"UIDevice", "MonoTouch.UIKit.UIDevice, monotouch", 0},
	{"UIColor", "MonoTouch.UIKit.UIColor, monotouch", 0},
	{"__NSObject_Disposer", "MonoTouch.Foundation.NSObject+NSObject_Disposer, monotouch", 0},
	{"NSDate", "MonoTouch.Foundation.NSDate, monotouch", 0},
	{"NSURL", "MonoTouch.Foundation.NSUrl, monotouch", 0},
	{"__MonoMac_NSActionDispatcher", "MonoTouch.Foundation.NSActionDispatcher, monotouch", 0},
	{"NSAutoreleasePool", "MonoTouch.Foundation.NSAutoreleasePool, monotouch", 0},
	{"UITouch", "MonoTouch.UIKit.UITouch, monotouch", 0},
	{"NSEnumerator", "MonoTouch.Foundation.NSEnumerator, monotouch", 0},
	{"NSTimer", "MonoTouch.Foundation.NSTimer, monotouch", 0},
	{"NSDictionary", "MonoTouch.Foundation.NSDictionary, monotouch", 0},
	{"NSRunLoop", "MonoTouch.Foundation.NSRunLoop, monotouch", 0},
	{"NSSet", "MonoTouch.Foundation.NSSet, monotouch", 0},
	{"NSString", "MonoTouch.Foundation.NSString, monotouch", 0},
	{"UIViewController", "MonoTouch.UIKit.UIViewController, monotouch", 0},
	{"UIApplication", "MonoTouch.UIKit.UIApplication, monotouch", 0},
	{"UIView", "MonoTouch.UIKit.UIView, monotouch", 0},
	{"AppDelegate", "Gossip.AppDelegate, Gossip", 0},
	{"ButtonView", "Gossip.ButtonView, Gossip", 0},
	{"SplashScreenView", "Gossip.SplashScreenView, Gossip", 0},
	{"OptionsView", "Gossip.OptionsView, Gossip", 0},
	{"MainView", "Gossip.MainView, Gossip", 0},
	{"HexagonView", "Gossip.HexagonView, Gossip", 0},
	{"HelpView", "Gossip.HelpView, Gossip", 0},
	{"UIWindow", "MonoTouch.UIKit.UIWindow, monotouch", 0},
	{"TipsViewController", "Gossip.TipsViewController, Gossip", 0},
	{"OptionsViewController", "Gossip.OptionsViewController, Gossip", 0},
	{"MainViewController", "Gossip.MainViewController, Gossip", 0},
	{"SplashScreenViewController", "Gossip.SplashScreenViewController, Gossip", 0},
	{"CharacterView", "Gossip.CharacterView, Gossip", 0},
	{"TextView", "Gossip.TextView, Gossip", 0},
	{"HelpViewController", "Gossip.HelpViewController, Gossip", 0},
	{"TipsView", "Gossip.TipsView, Gossip", 0},
	{"DownArrowButtonView", "Gossip.DownArrowButtonView, Gossip", 0},
	{"EnterButtonView", "Gossip.EnterButtonView, Gossip", 0},
	{"RulesButtonView", "Gossip.RulesButtonView, Gossip", 0},
	{"TipsButtonView", "Gossip.TipsButtonView, Gossip", 0},
	{"HardButtonView", "Gossip.HardButtonView, Gossip", 0},
	{"MediumButtonView", "Gossip.MediumButtonView, Gossip", 0},
	{"EasyButtonView", "Gossip.EasyButtonView, Gossip", 0},
	{"SixButtonView", "Gossip.SixButtonView, Gossip", 0},
	{"FiveButtonView", "Gossip.FiveButtonView, Gossip", 0},
	{"FourButtonView", "Gossip.FourButtonView, Gossip", 0},
	{"UpArrowButtonView", "Gossip.UpArrowButtonView, Gossip", 0},
	{"TurnView", "Gossip.TurnView, Gossip", 0},
	{"PhaseView", "Gossip.PhaseView, Gossip", 0},
	{"RightArrowHelpView", "Gossip.RightArrowHelpView, Gossip", 0},
	{"LeftArrowHelpView", "Gossip.LeftArrowHelpView, Gossip", 0},
	{"VersionView", "Gossip.VersionView, Gossip", 0},
	{"PlayAgainButtonView", "Gossip.PlayAgainButtonView, Gossip", 0},
	{"MessageView", "Gossip.MessageView, Gossip", 0},
	{"BaraView", "Gossip.BaraView, Gossip", 0},
	{"RightArrowOptionsView", "Gossip.RightArrowOptionsView, Gossip", 0},
	{"EllaView", "Gossip.EllaView, Gossip", 0},
	{"MaxView", "Gossip.MaxView, Gossip", 0},
	{"OwenView", "Gossip.OwenView, Gossip", 0},
	{"LeftArrowTipsView", "Gossip.LeftArrowTipsView, Gossip", 0},
	{"ZoeView", "Gossip.ZoeView, Gossip", 0},
	{"MortView", "Gossip.MortView, Gossip", 0},
};

static MTClass __monotouch_classes [] = {
	{"__NSObject_Disposer", "NSObject", 1, 2, 0},
	{"__MonoMac_NSActionDispatcher", "NSObject", 1, 1, 0},
	{"AppDelegate", "NSObject", 1, 2, 0},
	{"ButtonView", "UIView", 1, 2, 0},
	{"SplashScreenView", "UIView", 1, 1, 0},
	{"OptionsView", "UIView", 1, 1, 0},
	{"MainView", "UIView", 1, 1, 0},
	{"HexagonView", "UIView", 1, 2, 0},
	{"HelpView", "UIView", 1, 1, 0},
	{"TipsViewController", "UIViewController", 1, 3, 0},
	{"OptionsViewController", "UIViewController", 1, 3, 0},
	{"MainViewController", "UIViewController", 1, 6, 0},
	{"SplashScreenViewController", "UIViewController", 1, 3, 0},
	{"CharacterView", "UIView", 1, 3, 0},
	{"TextView", "UIView", 1, 1, 0},
	{"HelpViewController", "UIViewController", 1, 4, 0},
	{"TipsView", "UIView", 1, 1, 0},
	{"DownArrowButtonView", "ButtonView", 1, 4, 0},
	{"EnterButtonView", "ButtonView", 1, 4, 0},
	{"RulesButtonView", "ButtonView", 1, 4, 0},
	{"TipsButtonView", "ButtonView", 1, 4, 0},
	{"HardButtonView", "ButtonView", 1, 3, 0},
	{"MediumButtonView", "ButtonView", 1, 3, 0},
	{"EasyButtonView", "ButtonView", 1, 3, 0},
	{"SixButtonView", "ButtonView", 1, 3, 0},
	{"FiveButtonView", "ButtonView", 1, 3, 0},
	{"FourButtonView", "ButtonView", 1, 3, 0},
	{"UpArrowButtonView", "ButtonView", 1, 4, 0},
	{"TurnView", "TextView", 1, 2, 0},
	{"PhaseView", "TextView", 1, 2, 0},
	{"RightArrowHelpView", "ButtonView", 1, 4, 0},
	{"LeftArrowHelpView", "ButtonView", 1, 4, 0},
	{"VersionView", "TextView", 1, 2, 0},
	{"PlayAgainButtonView", "ButtonView", 1, 4, 0},
	{"MessageView", "TextView", 1, 2, 0},
	{"BaraView", "CharacterView", 1, 2, 0},
	{"RightArrowOptionsView", "ButtonView", 1, 4, 0},
	{"EllaView", "CharacterView", 1, 2, 0},
	{"MaxView", "CharacterView", 1, 2, 0},
	{"OwenView", "CharacterView", 1, 2, 0},
	{"LeftArrowTipsView", "ButtonView", 1, 4, 0},
	{"ZoeView", "CharacterView", 1, 2, 0},
	{"MortView", "CharacterView", 1, 2, 0},
};

static MTIvar __monotouch_ivars [] = {
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
	{"__monoObjectGCHandle", "i", 4, 4},
};

static MTMethod __monotouch_methods [] = {
	{"init","@@:",0, &native_to_managed_trampoline_MonoTouch_Foundation_NSObject_NSObject_Disposer__ctor},
	{"drain:","v@:@",1, &native_to_managed_trampoline_MonoTouch_Foundation_NSObject_NSObject_Disposer_Drain},
	{"xamarinApplySelector","v@:",0, &native_to_managed_trampoline_MonoTouch_Foundation_NSActionDispatcher_Apply},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_AppDelegate__ctor},
	{"application:didFinishLaunchingWithOptions:","B@:@@",0, &native_to_managed_trampoline_Gossip_AppDelegate_FinishedLaunching},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_ButtonView__ctor},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_ButtonView_TouchesEnded},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_SplashScreenView_Draw},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_OptionsView_Draw},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_MainView_Draw},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_HexagonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_HexagonView_Draw},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_HelpView_Draw},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_TipsViewController__ctor},
	{"didReceiveMemoryWarning","v@:",0, &native_to_managed_trampoline_Gossip_TipsViewController_DidReceiveMemoryWarning},
	{"viewDidLoad","v@:",0, &native_to_managed_trampoline_Gossip_TipsViewController_ViewDidLoad},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_OptionsViewController__ctor},
	{"didReceiveMemoryWarning","v@:",0, &native_to_managed_trampoline_Gossip_OptionsViewController_DidReceiveMemoryWarning},
	{"viewDidLoad","v@:",0, &native_to_managed_trampoline_Gossip_OptionsViewController_ViewDidLoad},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_MainViewController__ctor},
	{"didReceiveMemoryWarning","v@:",0, &native_to_managed_trampoline_Gossip_MainViewController_DidReceiveMemoryWarning},
	{"viewDidLoad","v@:",0, &native_to_managed_trampoline_Gossip_MainViewController_ViewDidLoad},
	{"viewWillAppear:","v@:B",0, &native_to_managed_trampoline_Gossip_MainViewController_ViewWillAppear},
	{"viewWillDisappear:","v@:B",0, &native_to_managed_trampoline_Gossip_MainViewController_ViewWillDisappear},
	{"shouldAutorotateToInterfaceOrientation:","B@:i",0, &native_to_managed_trampoline_Gossip_MainViewController_ShouldAutorotateToInterfaceOrientation},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_SplashScreenViewController__ctor},
	{"didReceiveMemoryWarning","v@:",0, &native_to_managed_trampoline_Gossip_SplashScreenViewController_DidReceiveMemoryWarning},
	{"viewDidLoad","v@:",0, &native_to_managed_trampoline_Gossip_SplashScreenViewController_ViewDidLoad},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_CharacterView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_CharacterView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_CharacterView_TouchesBegan},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_TextView__ctor},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_HelpViewController__ctor},
	{"didReceiveMemoryWarning","v@:",0, &native_to_managed_trampoline_Gossip_HelpViewController_DidReceiveMemoryWarning},
	{"viewDidLoad","v@:",0, &native_to_managed_trampoline_Gossip_HelpViewController_ViewDidLoad},
	{"viewDidAppear:","v@:B",0, &native_to_managed_trampoline_Gossip_HelpViewController_ViewDidAppear},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_TipsView_Draw},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_DownArrowButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_DownArrowButtonView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_DownArrowButtonView_TouchesBegan},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_DownArrowButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_EnterButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_EnterButtonView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_EnterButtonView_TouchesBegan},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_EnterButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_RulesButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_RulesButtonView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_RulesButtonView_TouchesBegan},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_RulesButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_TipsButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_TipsButtonView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_TipsButtonView_TouchesBegan},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_TipsButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_HardButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_HardButtonView_Draw},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_HardButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_MediumButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_MediumButtonView_Draw},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_MediumButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_EasyButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_EasyButtonView_Draw},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_EasyButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_SixButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_SixButtonView_Draw},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_SixButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_FiveButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_FiveButtonView_Draw},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_FiveButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_FourButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_FourButtonView_Draw},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_FourButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_UpArrowButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_UpArrowButtonView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_UpArrowButtonView_TouchesBegan},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_UpArrowButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_TurnView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_TurnView_Draw},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_PhaseView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_PhaseView_Draw},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_RightArrowHelpView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_RightArrowHelpView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_RightArrowHelpView_TouchesBegan},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_RightArrowHelpView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_LeftArrowHelpView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_LeftArrowHelpView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_LeftArrowHelpView_TouchesBegan},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_LeftArrowHelpView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_VersionView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_VersionView_Draw},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_PlayAgainButtonView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_PlayAgainButtonView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_PlayAgainButtonView_TouchesBegan},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_PlayAgainButtonView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_MessageView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_MessageView_Draw},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_BaraView__ctor},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_BaraView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_RightArrowOptionsView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_RightArrowOptionsView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_RightArrowOptionsView_TouchesBegan},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_RightArrowOptionsView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_EllaView__ctor},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_EllaView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_MaxView__ctor},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_MaxView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_OwenView__ctor},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_OwenView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_LeftArrowTipsView__ctor},
	{"drawRect:","v@:{RectangleF=ffff}",0, &native_to_managed_trampoline_Gossip_LeftArrowTipsView_Draw},
	{"touchesBegan:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_LeftArrowTipsView_TouchesBegan},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_LeftArrowTipsView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_ZoeView__ctor},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_ZoeView_TouchesEnded},
	{"init","@@:",0, &native_to_managed_trampoline_Gossip_MortView__ctor},
	{"touchesEnded:withEvent:","v@:@@",0, &native_to_managed_trampoline_Gossip_MortView_TouchesEnded},
};

static MTProperty __monotouch_properties [] = {
};

int __monotouch_map_count = 68;
static int __monotouch_class_count = 43;

void monotouch_create_classes (void) {
	int i,j;
	int ivar_offset = 0;
	int method_offset = 0;
	int prop_offset = 0;

	for (i = 0; i < __monotouch_class_count; i++) {
		Class handle = objc_allocateClassPair (objc_getClass (__monotouch_classes [i].supername), __monotouch_classes [i].name, 0);
		if (handle == NULL) {
			ivar_offset += __monotouch_classes [i].ivar_count;
			method_offset += __monotouch_classes [i].method_count;
			prop_offset += __monotouch_classes [i].prop_count;
			continue;
		}
		for (j = 0; j < __monotouch_classes [i].ivar_count; j++, ivar_offset++)
			class_addIvar (handle, __monotouch_ivars [ivar_offset].name, __monotouch_ivars [ivar_offset].size, __monotouch_ivars [ivar_offset].align, __monotouch_ivars [ivar_offset].type);
		class_addMethod (handle, sel_registerName ("release"), (IMP) &monotouch_release_trampoline, "v@:");
		class_addMethod (handle, sel_registerName ("retain"), (IMP) &monotouch_retain_trampoline, "@@:");
		class_addMethod (handle, sel_registerName ("conformsToProtocol:"), (IMP) &monotouch_trampoline, "B@:^v");
		for (j = 0; j < __monotouch_classes [i].method_count; j++, method_offset++) {
			Class h = (__monotouch_methods [method_offset].isstatic ? handle->isa : handle);
			class_addMethod (h, sel_registerName (__monotouch_methods [method_offset].selector), __monotouch_methods [method_offset].trampoline, __monotouch_methods [method_offset].signature);
		}
		for (j = 0; j < __monotouch_classes [i].prop_count; j++, prop_offset++) {
			int count = 0;
			objc_property_attribute_t props[3];
			props [count].name = "T";
			props [count++].value = __monotouch_properties [prop_offset].type;
			if (*__monotouch_properties [prop_offset].argument_semantic != 0) {
				props [count].name = __monotouch_properties [prop_offset].argument_semantic;
				props [count++].value = "";
			}
			props [count].name = "V";
			props [count++].value = __monotouch_properties [prop_offset].name;
			class_addProperty (handle, __monotouch_properties [prop_offset].name, props, count);;
		}
		objc_registerClassPair (handle);
	}
	for (i = 0; i < __monotouch_map_count; i++) {
		__monotouch_class_map [i].handle = objc_getClass (__monotouch_class_map [i].name);
	}
	monotouch_setup_classmap (__monotouch_class_map, __monotouch_map_count);
}
