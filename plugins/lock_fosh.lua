local function pre_process(msg)
	local chkfosh = redis:hget('settings:fosh',msg.chat_id_)
	if not chkfosh then
		redis:hset('settings:fosh',msg.chat_id_,'off')
	end
end

local function run(msg, matches)
	--Commands --دستورات فعال و غیرفعال کردن فحش

	if matches[1]:lower() == 'unlock' then
		if matches[2]:lower() == 'fosh' then
			if not is_mod(msg) then return end
			local fosh = redis:hget('settings:fosh',msg.chat_id_)
			if fosh == 'on' then
				redis:hset('settings:fosh',msg.chat_id_,'off')
				return ''
			elseif fosh == 'off' then
				return ''
			end
		end
	end
	if matches[1]:lower() == 'lock' then
		if matches[2]:lower() == 'fosh' then
			if not is_mod(msg) then return end
			local fosh = redis:hget('settings:fosh',msg.chat_id_)
			if fosh == 'off' then
				redis:hset('settings:fosh',msg.chat_id_,'on')
				return ''
			elseif fosh == 'on' then
				return ''
			end
		end
	end

	--Delete words contains --حذف پیامهای فحش
	if not is_mod(msg) then
		local fosh = redis:hget('settings:fosh',msg.chat_id_)
		if fosh == 'on' then
			tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)
		end
	end
end

return {
  patterns = {

    "کیر",
	"کص",
	"کــــــــــیر",
	"کــــــــــــــــــــــــــــــیر",
	"کـیـــــــــــــــــــــــــــــــــــــــــــــــــــر",
	"کــــــــــیرر",
    "kir",
	"kos",
	"جاکش",
	"قرمساق",
	"دیوس",
	"دیوص",
	"dayus",
	"dayos",
	"dayu3",
	"10yus",
	"10yu3",
	"daus",
	"گایید",
	"گاییدی",
	"لاشی",
	"پدرسگ",
	"پدرسک",
	"پریود",
	"جاکش",
	"مادرسگ",
	"شورت",
	"عوضی",
	"داشاق",
	"داشاغ",
	"koskesh",
	"gaidam",
	"ننه قهوه",
	"مادرتوگاییدم",
	"پدرتوگاییدم",
	"بیابخور",
	"جنده",
	"مادرجنده",
	"حشری",
	"جق",
	"جقی",
	"ساک",
	"فاک",
	"لز",
	"مادرقهبه",
	"حرومزاده",
	"کوس",
	"jende",
	"بسیک",
	"بخورش",
	"sex",
	"SEX",
	"sexy",
	"SEXY",
	"Sexy",
	"kos",
	"KOS",
	"FUK",
	"fuk",
	"fuck",
	"fak",
	"koloft",
	"bk",
	"گایید",
	"تخمم",
	"کص کش",
	"آلت",
	"کصشعر",
	"لیسیدن",
	"اوبی",
	"جاکش",
	"واژن",
	"خارکسه",
	"کیر",
	"سوپر",
	"توله سگ",
	"پورن",
	"کونی",
	"oskol",
	"کسکش",
	"کیرم",
	"کیر",
	"تخمی",
	"گاییدم",
	"کسخلا",
	"ممه",
	"کون",
	"سیکتیر",
	"سیک",
	"گاییدمت",
	"جق",
	"کص",
	"کسکش",
	"حرومزاده",
	"سگ پدر",
	"مادر جنده",
	"جنده",
	"سکسی",
	"سکس",
	"بکنمت",
	"کونی",
	"چاقال",
	"کونده",
	"مادر قهوه",
	"مادرقهوه",
	"کیرم دهنت",
	"dau3",
	"تخمی",
	"حرومزاده",
	"حروم زاده",
	"harumzade",
	"haromzade",
	"haroomzade",
	"lashi",
	"لاشی",
	"لاشي",
	"جنده",
	"jende",
	"tokhmi",
	"madarjende",
	"kharkosde",
	"kharko3de",
	"مادرجنده",

	--Commands ##Don't change this##
	"^[!/#]([Ll][Oo][Cc][Kk]) (.*)$",
	"^[!/#]([Uu][Nn][Ll][Oo][Cc][Kk]) (.*)$",
	------------End----------------
  },
  run = run,
  pre_process = pre_process
}
