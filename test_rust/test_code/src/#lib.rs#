/*use emacs::{defun,Env,Result,Value};
emacs::plugin_is_GPL_compatible!();

#[emacs::module(name = "greeting")]
fn init(_: &Env) -> Result<()> { Ok(()) }

#[defun]
fn say_hello(env: &Env, name: String) -> Result<Value<'_>> {
    env.message(&format!("Hello, {}!", name))
}
 */

#[cfg(target_arch="wasm32")]
//mod utils;
use wasm_bindgen::prelude::*;

#[cfg(target_arch="wasm32")]
#[derive(Clone)]
#[wasm_bindgen]
pub struct WebHandle{
    runner: eframe::WebRunner,
}
#[cfg(target_arch="wasm32")]
#[wasm_bindgen]
impl WebHandle{
#[wasm_bindgen(constructor)]
    pub  fn new()->Self{
	//     *self.runner
	Self{runner: eframe::WebRunner::new(),}
    }
#[wasm_bindgen]
    pub async fn start(&self,canvas_id:&str)->Result<(),wasm_bindgen::JsValue>{
	self.runner.start(
	    canvas_id,
	    eframe::WebOptions::default(),
	    Box::new(|cc|Box::new(WrapApp::new(cc))) ,
	).await

    }
      #[wasm_bindgen]
    pub fn destroy(&self) {
        self.runner.destroy();
    }

    /// Example on how to call into your app from JavaScript.
    #[wasm_bindgen]
    pub fn example(&self) {
        if let Some(_app) = self.runner.app_mut::<WrapApp>() {
            // _app.example();
        }
    }

    /// The JavaScript can check whether or not your app has crashed:
    #[wasm_bindgen]
    pub fn has_panicked(&self) -> bool {
        self.runner.has_panicked()
    }

    #[wasm_bindgen]
    pub fn panic_message(&self) -> Option<String> {
        self.runner.panic_summary().map(|s| s.message())
    }

    #[wasm_bindgen]
    pub fn panic_callstack(&self) -> Option<String> {
        self.runner.panic_summary().map(|s| s.callstack())
    }
    
}
#[warn(unused)]
pub struct WrapApp{
	name:String,
    age:u32,
        boxes:bool,
    }

impl WrapApp{

   pub   fn new(_cc:&eframe::CreationContext<'_>)->Self{
	    Self{
		name:String::from("tom"),
		age:16,
		boxes:true,
	    }
	}
    }

impl eframe::App for WrapApp{
      fn update(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
	  
	  egui::CentralPanel::default().show(ctx, |ui| {
            ui.heading("My egui Application");
	     
            ui.horizontal(|ui| {
                let name_label = ui.label("Your name: ");
                ui.text_edit_singleline(&mut self.name)
                    .labelled_by(name_label.id);
            });
            ui.add(egui::Slider::new(&mut self.age, 0..=120).text("age"));
            if ui.button("Increment").clicked() {
                self.age += 2;
            }
              ui.label(format!("Hello! '{}', age {}", self.name, self.age));
	      ui.checkbox(&mut self.boxes,"boxs");
        });
    }
   }
