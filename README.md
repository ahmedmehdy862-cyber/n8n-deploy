# n8n على Railway / Render - دليل النشر الكامل

## 🚀 الطريقة 1: Railway (الأسهل - 3 دقائق)

### الخطوات:
1. **ارفع هذا المجلد على GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Deploy n8n"
   git branch -M main
   git remote add origin https://github.com/USERNAME/n8n-deploy.git
   git push -u origin main
   ```

2. **افتح Railway:**
   - ادخل على https://railway.app
   - سجل بحساب GitHub
   - اضغط `New Project` → `Deploy from GitHub repo`
   - اختر مستودع `n8n-deploy`

3. **أضف المتغيرات (Variables):**
   في Railway → Variables أضف:
   ```
   N8N_ENCRYPTION_KEY= أي نص عشوائي 32 حرف (مهم جدا)
   N8N_BASIC_AUTH_ACTIVE=true
   N8N_BASIC_AUTH_USER=admin
   N8N_BASIC_AUTH_PASSWORD= كلمة سر قوية
   GENERIC_TIMEZONE=Africa/Cairo
   WEBHOOK_URL= https://${{RAILWAY_PUBLIC_DOMAIN}}/
   ```

4. **احصل على الرابط:**
   Railway → Settings → Networking → Generate Domain
   → سيعطيك رابط مثل `https://n8n-production.up.railway.app`

---

## 🎨 الطريقة 2: Render (مجاني 100%)

1. ارفع على GitHub بنفس الطريقة أعلاه
2. ادخل على https://render.com
3. `New` → `Blueprint` → اختر المستودع
4. Render سيقرأ ملف `render.yaml` تلقائيا وينشئ الخدمة
5. انتظر 3 دقائق → تحصل على رابط `https://n8n-xxxx.onrender.com`

> **ملاحظة Render:** الخطة المجانية تنام بعد 15 دقيقة بدون استخدام، وتستيقظ عند أول زيارة (تأخير 30 ثانية).

---

## 💻 التشغيل المحلي (للتجربة)

```bash
docker-compose up -d
# افتح http://localhost:5678
```

أو بدون Docker:
```bash
npx n8n
```

---

## 🔐 مهم بعد النشر

1. غير `N8N_ENCRYPTION_KEY` - لو ضاع ستفقد كل بيانات الاعتماد
2. احفظ كلمة مرور الـ Basic Auth
3. في n8n → Settings → اضبط الـ Webhook URL على رابطك الجديد

## 📁 محتويات المجلد

- `Dockerfile` - للسيرفر
- `docker-compose.yml` - للتشغيل المحلي
- `railway.json` - إعدادات Railway
- `render.yaml` - إعدادات Render
- `.env.example` - مثال للمتغيرات

## ❓ أي مشكلة؟

تأكد من Logs في Railway/Render → لو ظهر `n8n ready` يعني نجح!

