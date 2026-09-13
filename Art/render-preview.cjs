// Run with NODE_PATH pointing to a Playwright installation.
const {chromium}=require('playwright');
const http=require('http'),fs=require('fs'),path=require('path');
const root=__dirname;
const server=http.createServer((req,res)=>{
 const name=decodeURIComponent(req.url.split('?')[0]).replace(/^\//,'') || 'preview.html';
 if(!['preview.html','preview-palette.json','Preview.png'].includes(name)){res.writeHead(404).end();return;}
 res.setHeader('Content-Type',name.endsWith('.png')?'image/png':name.endsWith('.json')?'application/json':'text/html; charset=utf-8');
 res.end(fs.readFileSync(path.join(root,name)));
});
(async()=>{
 await new Promise(r=>server.listen(0,'127.0.0.1',r));
 const browser=await chromium.launch({channel:'chrome',headless:true});
 try {
  const page=await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});
  await page.goto('http://127.0.0.1:'+server.address().port);
  await page.waitForFunction(()=>document.body.dataset.ready==='true');
  const fonts=await page.evaluate(()=>({segoe:document.fonts.check('46px "Segoe UI"'),font:getComputedStyle(document.body).fontFamily}));
  await page.screenshot({path:path.join(root,'../Mod/About/Preview.png')});
  await page.addStyleTag({content:'.copy,.version{visibility:hidden}'});
  await page.screenshot({path:path.join(root,'preview-background.png')});
  fs.writeFileSync(path.join(root,'render-result.json'),JSON.stringify(fonts,null,2)+'\n');
  console.log(fonts);
 } finally {await browser.close();server.close();}
})().catch(e=>{console.error(e);server.close();process.exitCode=1});
