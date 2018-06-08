//
//  WooCurrency.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// <#Description#>
///
/// - aed: <#aed description#>
/// - afn: <#afn description#>
/// - all: <#all description#>
/// - amd: <#amd description#>
/// - ang: <#ang description#>
/// - aoa: <#aoa description#>
/// - ars: <#ars description#>
/// - aud: <#aud description#>
/// - awg: <#awg description#>
/// - azn: <#azn description#>
/// - bam: <#bam description#>
/// - bbd: <#bbd description#>
/// - bdt: <#bdt description#>
/// - bgn: <#bgn description#>
/// - bhd: <#bhd description#>
/// - bif: <#bif description#>
/// - bmd: <#bmd description#>
/// - bnd: <#bnd description#>
/// - bob: <#bob description#>
/// - brl: <#brl description#>
/// - bsd: <#bsd description#>
/// - btc: <#btc description#>
/// - btn: <#btn description#>
/// - bwp: <#bwp description#>
/// - byr: <#byr description#>
/// - bzd: <#bzd description#>
/// - cad: <#cad description#>
/// - cdf: <#cdf description#>
/// - chf: <#chf description#>
/// - clp: <#clp description#>
/// - cny: <#cny description#>
/// - cop: <#cop description#>
/// - crc: <#crc description#>
/// - cuc: <#cuc description#>
/// - cup: <#cup description#>
/// - cve: <#cve description#>
/// - czk: <#czk description#>
/// - djf: <#djf description#>
/// - dkk: <#dkk description#>
/// - dop: <#dop description#>
/// - dzd: <#dzd description#>
/// - egp: <#egp description#>
/// - ern: <#ern description#>
/// - etb: <#etb description#>
/// - eur: <#eur description#>
/// - fjd: <#fjd description#>
/// - fkp: <#fkp description#>
/// - gbp: <#gbp description#>
/// - gel: <#gel description#>
/// - ggp: <#ggp description#>
/// - ghs: <#ghs description#>
/// - gip: <#gip description#>
/// - gmd: <#gmd description#>
/// - gnf: <#gnf description#>
/// - gtq: <#gtq description#>
/// - gyd: <#gyd description#>
/// - hkd: <#hkd description#>
/// - hnl: <#hnl description#>
/// - hrk: <#hrk description#>
/// - htg: <#htg description#>
/// - huf: <#huf description#>
/// - idr: <#idr description#>
/// - ils: <#ils description#>
/// - imp: <#imp description#>
/// - inr: <#inr description#>
/// - iqd: <#iqd description#>
/// - irr: <#irr description#>
/// - irt: <#irt description#>
/// - isk: <#isk description#>
/// - jep: <#jep description#>
/// - jmd: <#jmd description#>
/// - jod: <#jod description#>
/// - jpy: <#jpy description#>
/// - kes: <#kes description#>
/// - kgs: <#kgs description#>
/// - khr: <#khr description#>
/// - kmf: <#kmf description#>
/// - kpw: <#kpw description#>
/// - KRW: <#KRW description#>
/// - kwd: <#kwd description#>
/// - kyd: <#kyd description#>
/// - kzt: <#kzt description#>
/// - lak: <#lak description#>
/// - lbp: <#lbp description#>
/// - lkr: <#lkr description#>
/// - lrd: <#lrd description#>
/// - lsl: <#lsl description#>
/// - lyd: <#lyd description#>
/// - mad: <#mad description#>
/// - mdl: <#mdl description#>
/// - mga: <#mga description#>
/// - mkd: <#mkd description#>
/// - mmk: <#mmk description#>
/// - mnt: <#mnt description#>
/// - mop: <#mop description#>
/// - mro: <#mro description#>
/// - mur: <#mur description#>
/// - mvr: <#mvr description#>
/// - mwk: <#mwk description#>
/// - mxn: <#mxn description#>
/// - myr: <#myr description#>
/// - mzn: <#mzn description#>
/// - nad: <#nad description#>
/// - ngn: <#ngn description#>
/// - nio: <#nio description#>
/// - nok: <#nok description#>
/// - npr: <#npr description#>
/// - nzd: <#nzd description#>
/// - omr: <#omr description#>
/// - pab: <#pab description#>
/// - pen: <#pen description#>
/// - pgk: <#pgk description#>
/// - php: <#php description#>
/// - pkr: <#pkr description#>
/// - pln: <#pln description#>
/// - prb: <#prb description#>
/// - pyg: <#pyg description#>
/// - qar: <#qar description#>
/// - ron: <#ron description#>
/// - rsd: <#rsd description#>
/// - rub: <#rub description#>
/// - rwf: <#rwf description#>
/// - sar: <#sar description#>
/// - sbd: <#sbd description#>
/// - scr: <#scr description#>
/// - sdg: <#sdg description#>
/// - sek: <#sek description#>
/// - sgd: <#sgd description#>
/// - shp: <#shp description#>
/// - sll: <#sll description#>
/// - sos: <#sos description#>
/// - srd: <#srd description#>
/// - ssp: <#ssp description#>
/// - std: <#std description#>
/// - syp: <#syp description#>
/// - szl: <#szl description#>
/// - thb: <#thb description#>
/// - tjs: <#tjs description#>
/// - tmt: <#tmt description#>
/// - tnd: <#tnd description#>
/// - top: <#top description#>
/// - try_: <#try_ description#>
/// - ttd: <#ttd description#>
/// - twd: <#twd description#>
/// - tzd: <#tzd description#>
/// - uah: <#uah description#>
/// - ugx: <#ugx description#>
/// - usd: <#usd description#>
/// - uyu: <#uyu description#>
/// - uzs: <#uzs description#>
/// - vef: <#vef description#>
/// - vnd: <#vnd description#>
/// - vuv: <#vuv description#>
/// - wst: <#wst description#>
/// - xaf: <#xaf description#>
/// - xcd: <#xcd description#>
/// - xof: <#xof description#>
/// - xpf: <#xpf description#>
/// - yer: <#yer description#>
/// - zar: <#zar description#>
/// - zmw: <#zmw description#>
public enum WooCurrency: String {
    case aed = "AED"
    case afn = "AFN"
    case all = "ALL"
    case amd = "AMD"
    case ang = "ANG"
    case aoa = "AOA"
    case ars = "ARS"
    case aud = "AUD"
    case awg = "AWG"
    case azn = "AZN"
    case bam = "BAM"
    case bbd = "BBD"
    case bdt = "BDT"
    case bgn = "BGN"
    case bhd = "BHD"
    case bif = "BIF"
    case bmd = "BMD"
    case bnd = "BND"
    case bob = "BOB"
    case brl = "BRL"
    case bsd = "BSD"
    case btc = "BTC"
    case btn = "BTN"
    case bwp = "BWP"
    case byr = "BYR"
    case bzd = "BZD"
    case cad = "CAD"
    case cdf = "CDF"
    case chf = "CHF"
    case clp = "CLP"
    case cny = "CNY"
    case cop = "COP"
    case crc = "CRC"
    case cuc = "CUC"
    case cup = "CUP"
    case cve = "CVE"
    case czk = "CZK"
    case djf = "DJF"
    case dkk = "DKK"
    case dop = "DOP"
    case dzd = "DZD"
    case egp = "EGP"
    case ern = "ERN"
    case etb = "ETB"
    case eur = "EUR"
    case fjd = "FJD"
    case fkp = "FKP"
    case gbp = "GBP"
    case gel = "GEL"
    case ggp = "GGP"
    case ghs = "GHS"
    case gip = "GIP"
    case gmd = "GMD"
    case gnf = "GNF"
    case gtq = "GTQ"
    case gyd = "GYD"
    case hkd = "HKD"
    case hnl = "HNL"
    case hrk = "HRK"
    case htg = "HTG"
    case huf = "HUF"
    case idr = "IDR"
    case ils = "ILS"
    case imp = "IMP"
    case inr = "INR"
    case iqd = "IQD"
    case irr = "IRR"
    case irt = "IRT"
    case isk = "ISK"
    case jep = "JEP"
    case jmd = "JMD"
    case jod = "JOD"
    case jpy = "JPY"
    case kes = "KES"
    case kgs = "KGS"
    case khr = "KHR"
    case kmf = "KMF"
    case kpw = "KPW"
    case KRW = "krw"
    case kwd = "KWD"
    case kyd = "KYD"
    case kzt = "KZT"
    case lak = "LAK"
    case lbp = "LBP"
    case lkr = "LKR"
    case lrd = "LRD"
    case lsl = "LSL"
    case lyd = "LYD"
    case mad = "MAD"
    case mdl = "MDL"
    case mga = "MGA"
    case mkd = "MKD"
    case mmk = "MMK"
    case mnt = "MNT"
    case mop = "MOP"
    case mro = "MRO"
    case mur = "MUR"
    case mvr = "MVR"
    case mwk = "MWK"
    case mxn = "MXN"
    case myr = "MYR"
    case mzn = "MZN"
    case nad = "NAD"
    case ngn = "NGN"
    case nio = "NIO"
    case nok = "NOK"
    case npr = "NPR"
    case nzd = "NZD"
    case omr = "OMR"
    case pab = "PAB"
    case pen = "PEN"
    case pgk = "PGK"
    case php = "PHP"
    case pkr = "PKR"
    case pln = "PLN"
    case prb = "PRB"
    case pyg = "PYG"
    case qar = "QAR"
    case ron = "RON"
    case rsd = "RSD"
    case rub = "RUB"
    case rwf = "RWF"
    case sar = "SAR"
    case sbd = "SBD"
    case scr = "SCR"
    case sdg = "SDG"
    case sek = "SEK"
    case sgd = "SGD"
    case shp = "SHP"
    case sll = "SLL"
    case sos = "SOS"
    case srd = "SRD"
    case ssp = "SSP"
    case std = "STD"
    case syp = "SYP"
    case szl = "SZL"
    case thb = "THB"
    case tjs = "TJS"
    case tmt = "TMT"
    case tnd = "TND"
    case top = "TOP"
    case try_ = "TRY"
    case ttd = "TTD"
    case twd = "TWD"
    case tzd = "TZS"
    case uah = "UAH"
    case ugx = "UGX"
    case usd = "USD"
    case uyu = "UYU"
    case uzs = "UZS"
    case vef = "VEF"
    case vnd = "VND"
    case vuv = "VUV"
    case wst = "WST"
    case xaf = "XAF"
    case xcd = "XCD"
    case xof = "XOF"
    case xpf = "XPF"
    case yer = "YER"
    case zar = "ZAR"
    case zmw = "ZMW"
}
