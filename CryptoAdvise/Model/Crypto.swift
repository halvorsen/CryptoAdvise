//
//  Crypto.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/20/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

enum Crypto: String, CaseIterable { // coins on binance as of 8/2018
    case ETH, BTC, EOS, XLM, IOST, BCC, TRX, BNB, ADA, XRP, QKC, NEO, LTC, ICX, ARN, ZRX, ZIL, KEY, NPXS, ONT, IOTA, ETC, TUSD, REP, NAS, ADX, BAT, XMR, HOT, DASH, XVG, GTO, IOTX, INS, VEN, WAN, DENT, LINK, KMD, LOOM, STRAT, SNT, GVT, ZEC, MFT, STORM, WTC, ENJ, BQX, ARDR, ENG, NULS, NCASH, GRS, ZEN, SC, AION, QTUM, EDO, CVC, QSP, SUB, MTL, BTG, MANA, NXS, CDT, BRD, STEEM, BLZ, RCN, POE, BCPT, OMG, XEM, POWR, WINGS, AGI, SALT, SKY, GNT, VIB, TNB, STORJ, WRP, MDA, AE, MCO, PPT, ARK, GXS, POA, ELF, WAVES, THETA, AST, CMT, RPX, BCD, DATA, LSK, BTS, PIVX, TRIG, SYS, AMB, LEND, DNT, HSR, APPC, KNC, CND, CHAT, GAS, FUN, REQ, OAX, NEBL, OST, QLC, FUEL, SNM, NAV, XZC, ICN, LRC, YOYO, DLT, BCN, WABI, VIBE, CLOAK, RDN, RLC, WPR, MOD, DGD, TNT, EVX, BNT, SNGLS, NANO, MTH, VIA, LUN
}
// all the string resources associated with each coin. probably would be better to aggregate in an spreadsheet and import it, but this will have to do for mvp
extension Crypto {
    
    static let whitePaperTitle = "White Paper"
    
    struct Exchange {
        static let binance = ("binance", "https://www.binance.com")
        static let coinbase = ("coinbase", "https://www.coinbase.com")
        static let coinbull = ("coinbull", "https://www.coinbull.io")
        static let luno = ("luno", "https://www.luno.com")
        static let paxforex = ("paxforex", "https://paxforex.com")
        static let localBitcoins = ("localbitcoins", "https://localbitcoins.com")
        static let cex = ("cex", "https://cex.io")
        static let changelly = ("changelly", "https://changelly.com")
        static let coinmama = ("coinmama", "https://www.coinmama.com")
        static let xtrade = ("xtrade", "https://www.xtrade.com")
        static let paxful = ("paxful", "https://paxful.com")
        static let kraken = ("kraken", "https://www.kraken.com")
        static let poloniex = ("poloniex", "https://poloniex.com")
        static let gemini = ("gemini", "https://gemini.com")
        static let bithumb = ("bithumb", "https://www.bithumb.com")
        static let xcoins = ("xcoins", "https://xcoins.io")
        static let cobinhood = ("cobinhood", "https://cobinhood.com")
        static let coincheck = ("coincheck", "https://coincheck.com")
        static let coinexchange = ("coinexchange", "https://www.coinexchange.io")
        static let shapeshift = ("shapeshift", "https://shapeshift.io")
        static let bitso = ("bitso", "https://bitso.com")
        static let indacoin = ("indacoin", "https://indacoin.com")
        static let cityindex = ("cityindex", "https://www.cityindex.co")
        static let bitbay = ("bitbay", "https://auth.bitbay.net")
        static let bitstamp = ("bitstamp", "https://www.bitstamp.net")
        static let cryptopopia = ("cryptopia", "https://www.cryptopia.co.nz")
        static let gdax = ("coinbasepro", "https://pro.coinbase.com")
        static let kucoin = ("kucoin", "https://www.kucoin.com")
        static let bitpanda = ("bitpanda", "https://www.bitpanda.com")
        static let hitbtc = ("hitbtc", "https://hitbtc.com")
        static let coinswitch = ("coinswitch", "https://coinswitch.co")
        static let huobi = ("huobi", "https://www.huobi.com/en-us/")
        static let yobit = ("yobit", "https://yobit.net/")
        static let mercatox = ("mercatox", "https://mercatox.com")
        static let altcoin = ("altcoin", "https://altcoin.io")
        static let bigone = ("bigone", "https://big.one")
        static let robinhood = ("robinhood", "https://robinhood.com")
 
    }
    
    static let coinLinks: [Crypto: [(String, String)]] = [ // lots of exchanges to add but good enough for mvp
        .ETH: [(Crypto.whitePaperTitle, "https://github.com/ethereum/wiki/wiki/White-Paper"), Crypto.Exchange.binance, Crypto.Exchange.coinbase, Crypto.Exchange.robinhood, Crypto.Exchange.cobinhood, Crypto.Exchange.gdax, Crypto.Exchange.kucoin, Crypto.Exchange.kraken, Crypto.Exchange.hitbtc, Crypto.Exchange.coinswitch, Crypto.Exchange.huobi, Crypto.Exchange.yobit, Crypto.Exchange.mercatox, Crypto.Exchange.altcoin, Crypto.Exchange.bigone, Crypto.Exchange.coinbull, Crypto.Exchange.luno, Crypto.Exchange.paxforex, Crypto.Exchange.localBitcoins, Crypto.Exchange.cex, Crypto.Exchange.changelly, Crypto.Exchange.coinmama, Crypto.Exchange.xtrade, Crypto.Exchange.paxful, Crypto.Exchange.poloniex, Crypto.Exchange.gemini, Crypto.Exchange.bithumb, Crypto.Exchange.xcoins, Crypto.Exchange.coincheck, Crypto.Exchange.coinexchange, Crypto.Exchange.shapeshift, Crypto.Exchange.bitso, Crypto.Exchange.indacoin, Crypto.Exchange.cityindex, Crypto.Exchange.bitbay, Crypto.Exchange.bitstamp, Crypto.Exchange.cryptopopia, Crypto.Exchange.bitpanda],
        .BTC: [(Crypto.whitePaperTitle, "https://nakamotoinstitute.org/bitcoin/"), Crypto.Exchange.binance, Crypto.Exchange.coinbase, Crypto.Exchange.robinhood, Crypto.Exchange.cobinhood, Crypto.Exchange.gdax, Crypto.Exchange.kucoin, Crypto.Exchange.kraken, Crypto.Exchange.hitbtc, Crypto.Exchange.coinswitch, Crypto.Exchange.huobi, Crypto.Exchange.yobit, Crypto.Exchange.mercatox, Crypto.Exchange.altcoin, Crypto.Exchange.bigone,  Crypto.Exchange.coinbull, Crypto.Exchange.luno, Crypto.Exchange.paxforex, Crypto.Exchange.localBitcoins, Crypto.Exchange.cex, Crypto.Exchange.changelly, Crypto.Exchange.coinmama, Crypto.Exchange.xtrade, Crypto.Exchange.paxful, Crypto.Exchange.poloniex, Crypto.Exchange.gemini, Crypto.Exchange.bithumb, Crypto.Exchange.xcoins, Crypto.Exchange.coincheck, Crypto.Exchange.coinexchange, Crypto.Exchange.shapeshift, Crypto.Exchange.bitso, Crypto.Exchange.indacoin, Crypto.Exchange.cityindex, Crypto.Exchange.bitbay, Crypto.Exchange.bitstamp, Crypto.Exchange.cryptopopia, Crypto.Exchange.bitpanda],
        .EOS: [(Crypto.whitePaperTitle, "https://github.com/EOSIO/Documentation/blob/master/TechnicalWhitePaper.md"), Crypto.Exchange.binance, Crypto.Exchange.coinswitch, Crypto.Exchange.huobi, Crypto.Exchange.bithumb, Crypto.Exchange.yobit, Crypto.Exchange.kucoin, Crypto.Exchange.mercatox, Crypto.Exchange.changelly, Crypto.Exchange.altcoin, Crypto.Exchange.shapeshift, Crypto.Exchange.bigone, Crypto.Exchange.coinswitch],
        .XLM: [(Crypto.whitePaperTitle, "https://www.stellar.org/how-it-works/stellar-basics/explainers/"), Crypto.Exchange.binance, Crypto.Exchange.poloniex, Crypto.Exchange.cex, Crypto.Exchange.kraken, Crypto.Exchange.hitbtc, Crypto.Exchange.huobi, Crypto.Exchange.kucoin],
        .IOST: [(Crypto.whitePaperTitle, "https://iost.io"), Crypto.Exchange.binance, Crypto.Exchange.huobi, Crypto.Exchange.kucoin, Crypto.Exchange.hitbtc, Crypto.Exchange.bigone, Crypto.Exchange.yobit, Crypto.Exchange.cobinhood],
        .BCC: [Crypto.Exchange.binance, Crypto.Exchange.changelly, Crypto.Exchange.changelly, Crypto.Exchange.hitbtc, Crypto.Exchange.coinexchange],
        .TRX: [(Crypto.whitePaperTitle, "https://tron.network/index?lng=en"), Crypto.Exchange.binance, Crypto.Exchange.huobi, Crypto.Exchange.hitbtc, Crypto.Exchange.bithumb, Crypto.Exchange.mercatox, Crypto.Exchange.coinexchange, Crypto.Exchange.yobit, Crypto.Exchange.cryptopopia],
        .BNB: [(Crypto.whitePaperTitle, "https://www.binance.com/resources/ico/Binance_WhitePaper_en.pdf"), Crypto.Exchange.binance, Crypto.Exchange.huobi],
        .ADA: [(Crypto.whitePaperTitle, "https://www.cardano.org/en/home/"), Crypto.Exchange.binance, Crypto.Exchange.huobi, Crypto.Exchange.hitbtc, Crypto.Exchange.cryptopopia],
        .XRP: [(Crypto.whitePaperTitle, "https://ripple.com/files/ripple_consensus_whitepaper.pdf"), Crypto.Exchange.binance, Crypto.Exchange.kraken, Crypto.Exchange.bitso, Crypto.Exchange.coincheck, Crypto.Exchange.cex],
        .QKC: [(Crypto.whitePaperTitle, "https://quarkchain.io/QUARK%20CHAIN%20Public%20Version%200.3.4.pdf"), Crypto.Exchange.binance, Crypto.Exchange.kucoin, Crypto.Exchange.yobit],
        .NEO: [(Crypto.whitePaperTitle, "http://docs.neo.org/en-us/"), Crypto.Exchange.binance, Crypto.Exchange.huobi, Crypto.Exchange.hitbtc, Crypto.Exchange.cobinhood, Crypto.Exchange.cryptopopia],
        .LTC: [Crypto.Exchange.binance, Crypto.Exchange.coinbase, Crypto.Exchange.huobi, Crypto.Exchange.hitbtc, Crypto.Exchange.gdax, Crypto.Exchange.kraken, Crypto.Exchange.poloniex, Crypto.Exchange.yobit, Crypto.Exchange.cryptopopia, Crypto.Exchange.bithumb],
        .ICX: [(Crypto.whitePaperTitle, "https://docs.icon.foundation/ICON-Whitepaper-EN-Draft.pdf"), Crypto.Exchange.binance, Crypto.Exchange.bithumb, Crypto.Exchange.huobi, Crypto.Exchange.hitbtc],
        .ARN: [(Crypto.whitePaperTitle, "https://i.aeron.aero/storage/AeronWhitepaper.pdf"), Crypto.Exchange.binance],
        .ZRX: [(Crypto.whitePaperTitle, "https://0xproject.com/pdfs/0x_white_paper.pdf"), Crypto.Exchange.binance],
        .ZIL: [(Crypto.whitePaperTitle, "https://docs.zilliqa.com/whitepaper.pdf"), Crypto.Exchange.binance],
        .KEY: [(Crypto.whitePaperTitle, "https://www.thekey.vip/sites/default/files/pdf/THEKEY_Whitepaper_171112.pdf"), Crypto.Exchange.binance],
        .NPXS: [(Crypto.whitePaperTitle, "https://pundix.com/pdf/PundiX_Whitepaper_EN_Ver.pdf"), Crypto.Exchange.binance],
        .ONT: [(Crypto.whitePaperTitle, "https://ont.io/wp/Ontology-Introductory-White-Paper-EN.pdf"), Crypto.Exchange.binance],
        .IOTA: [(Crypto.whitePaperTitle, "http://iotatoken.com/IOTA_Whitepaper.pdf"), Crypto.Exchange.binance],
        .ETC: [(Crypto.whitePaperTitle, "https://ethereumclassic.github.io/assets/etc-thesis.pdf"), Crypto.Exchange.binance, Crypto.Exchange.coinbase],
        .TUSD: [(Crypto.whitePaperTitle, "https://tether.to/wp-content/uploads/2016/06/TetherWhitePaper.pdf"), Crypto.Exchange.binance],
        .REP: [(Crypto.whitePaperTitle, "https://www.augur.net/whitepaper.pdf"), Crypto.Exchange.binance],
        .NAS: [(Crypto.whitePaperTitle, "https://nebulas.io/docs/NebulasWhitepaper.pdf"), Crypto.Exchange.binance],
        .ADX: [(Crypto.whitePaperTitle, "https://www.adex.network/adex/AdEx-Whitepaper-v.7.pdf"), Crypto.Exchange.binance],
        .BAT: [(Crypto.whitePaperTitle, "https://basicattentiontoken.org/BasicAttentionTokenWhitePaper-4.pdf"), Crypto.Exchange.binance],
        .XMR: [(Crypto.whitePaperTitle, "https://www.monero.how"), Crypto.Exchange.binance],
        .HOT: [(Crypto.whitePaperTitle, "https://thehydrofoundation.com/Hydro-Whitepaper-v0116-en.pdf"), Crypto.Exchange.binance],
        .DASH: [(Crypto.whitePaperTitle, "https://github.com/dashpay/dash/wiki/Whitepaper"), Crypto.Exchange.binance],
        .XVG: [(Crypto.whitePaperTitle, "https://vergecurrency.com/static/blackpaper/Verge-Anonymity-Centric-CryptoCurrency.pdf"), Crypto.Exchange.binance],
        .GTO: [(Crypto.whitePaperTitle, "https://gifto.io/static/GIFTO_Whitepaper_EN.pdf"), Crypto.Exchange.binance],
        .IOTX: [(Crypto.whitePaperTitle, "https://iotex.io/white-paper"), Crypto.Exchange.binance],
        .INS: [(Crypto.whitePaperTitle, "https://ins.world/INS-ICO-Whitepaper.pdf"), Crypto.Exchange.binance],
        .VEN: [(Crypto.whitePaperTitle, "https://cdn.vechain.com/vechain_ico_ideas_of_development_en.pdf"), Crypto.Exchange.binance],
        .WAN: [(Crypto.whitePaperTitle, "https://wanchain.org/files/Wanchain-Whitepaper-EN-version.pdf"), Crypto.Exchange.binance],
        .DENT: [(Crypto.whitePaperTitle, "https://www.dentwireless.com/whitepaper"), Crypto.Exchange.binance],
        .LINK: [(Crypto.whitePaperTitle, "https://link.smartcontract.com/whitepaper"), Crypto.Exchange.binance],
        .KMD: [(Crypto.whitePaperTitle, "https://komodoplatform.com/wp-content/uploads/2018/06/Komodo-Whitepaper-June-3.pdf"), Crypto.Exchange.binance],
        .LOOM: [(Crypto.whitePaperTitle, "http://loom.world/loom-whitepaper.pdf"), Crypto.Exchange.binance],
        .STRAT: [(Crypto.whitePaperTitle, "https://stratisplatform.com/files/Stratis_Whitepaper.pdf"), Crypto.Exchange.binance],
        .SNT: [(Crypto.whitePaperTitle, "https://status.im/whitepaper.pdf"), Crypto.Exchange.binance],
        .GVT: [(Crypto.whitePaperTitle, "https://genesis.vision/white-paper-eng.pdf"), Crypto.Exchange.binance],
        .ZEC: [(Crypto.whitePaperTitle, "http://zerocash-project.org/media/pdf/zerocash-extended-20140518.pdf"), Crypto.Exchange.binance],
        .MFT: [(Crypto.whitePaperTitle, "https://mainframe.docsend.com/view/j39qpui"), Crypto.Exchange.binance],
        .STORM: [(Crypto.whitePaperTitle, "https://stormtoken.com"), Crypto.Exchange.binance],
        .WTC: [(Crypto.whitePaperTitle, "https://www.waltonchain.org/doc/Waltonchain-whitepaper_en_20180208.pdf"), Crypto.Exchange.binance],
        .ENJ: [(Crypto.whitePaperTitle, "https://enjincoin.io/enjincoin_whitepaper.pdf"), Crypto.Exchange.binance],
        .BQX: [(Crypto.whitePaperTitle, "https://www.ethos.io/Ethos_Whitepaper.pdf"), Crypto.Exchange.binance],
        .ARDR: [(Crypto.whitePaperTitle, "https://coss.io/documents/white-papers/ardor.pdf"), Crypto.Exchange.binance],
        .ENG: [(Crypto.whitePaperTitle, "https://enigma.co/enigma_full.pdf"), Crypto.Exchange.binance],
        .NULS: [(Crypto.whitePaperTitle, "https://nuls.io/papers"), Crypto.Exchange.binance],
        .NCASH: [(Crypto.whitePaperTitle, "https://nucleus.vision/light-paper.pdf?v=1.6.4"), Crypto.Exchange.binance],
        .GRS: [(Crypto.whitePaperTitle, "http://groestlcoin.org/forum/index.php?topic=64.0"), Crypto.Exchange.binance],
        .ZEN: [(Crypto.whitePaperTitle, "https://bravenewcoin.com/assets/Whitepapers/Zen-White-Paper.pdf"), Crypto.Exchange.binance],
        .SC: [(Crypto.whitePaperTitle, "https://sia.tech/sia.pdf"), Crypto.Exchange.binance],
        .AION: [(Crypto.whitePaperTitle, "https://aion.network/media/en-aion-network-technical-introduction.pdf"), Crypto.Exchange.binance],
        .QTUM: [(Crypto.whitePaperTitle, "https://qtum.org/user/pages/03.tech/01.white-papers/Qtum%20Whitepaper.pdf"), Crypto.Exchange.binance],
        .EDO: [(Crypto.whitePaperTitle, "https://www.edo.co/our-thinking/whitepaper-customer-centred-culture"), Crypto.Exchange.binance],
        .CVC: [(Crypto.whitePaperTitle, "https://tokensale.civic.com/CivicTokenSaleWhitePaper.pdf"), Crypto.Exchange.binance],
        .QSP: [(Crypto.whitePaperTitle, "https://docsend.com/view/shcsmhe"), Crypto.Exchange.binance],
        .SUB: [(Crypto.whitePaperTitle, "https://substratum.net/wp-content/uploads/2017/08/substratum_whitepaper.pdf"), Crypto.Exchange.binance],
        .MTL: [(Crypto.whitePaperTitle, "https://www.metalpay.com/assets/pdf/whitepaper.pdf"), Crypto.Exchange.binance],
        .BTG: [(Crypto.whitePaperTitle, "https://bitcoingold.org/wp-content/uploads/2017/10/BitcoinGold-Roadmap.pdf"), Crypto.Exchange.binance],
        .MANA: [(Crypto.whitePaperTitle, "https://decentraland.org/whitepaper.pdf"), Crypto.Exchange.binance],
        .NXS: [(Crypto.whitePaperTitle, "https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/whitepaper/products/nsx/vmware-nsx-network-virtualization-platform-white-paper.pdf"), Crypto.Exchange.binance],
        .CDT: [(Crypto.whitePaperTitle, "http://www.videomining.com/whitepaper-cdt-20-understanding-consumer-decisions-behavior-analytics"), Crypto.Exchange.binance],
        .BRD: [(Crypto.whitePaperTitle, "https://d2n2g5n187q8lu.cloudfront.net/static/docs/BRD-whitepaper-EN.pdf"), Crypto.Exchange.binance],
        .STEEM: [(Crypto.whitePaperTitle, "https://steem.io/steem-whitepaper.pdf"), Crypto.Exchange.binance],
        .BLZ: [(Crypto.whitePaperTitle, "https://bluzelle.com"), Crypto.Exchange.binance],
        .RCN: [(Crypto.whitePaperTitle, "https://ripiocredit.network/wp/RCN%20Whitepaper%20ENG.pdf"), Crypto.Exchange.binance],
        .POE: [(Crypto.whitePaperTitle, "http://www.saelig.com/supplier/amplicon/PoE-white-paper.pdf"), Crypto.Exchange.binance],
        .BCPT: [(Crypto.whitePaperTitle, "https://blockmason.io/cp-whitepaper/introduction-and-features/"), Crypto.Exchange.binance],
        .OMG: [(Crypto.whitePaperTitle, "https://cdn.omise.co/omg/whitepaper.pdf"), Crypto.Exchange.binance],
        .XEM: [(Crypto.whitePaperTitle, "https://www.nem.io/wp-content/themes/nem/files/NEM_techRef.pdf"), Crypto.Exchange.binance],
        .POWR: [(Crypto.whitePaperTitle, "https://web.powerledger.io/wp-content/uploads/2017/07/Power-Ledger-Whitepaper-1.pdf"), Crypto.Exchange.binance],
        .WINGS: [(Crypto.whitePaperTitle, "https://wingsfoundation.ch/docs/WINGS_Whitepaper_V1.1.2_en.pdf"), Crypto.Exchange.binance],
        .AGI: [(Crypto.whitePaperTitle, "https://public.singularitynet.io/whitepaper.pdf"), Crypto.Exchange.binance],
        .SALT: [(Crypto.whitePaperTitle, "https://membership.saltlending.com/files/abstract.pdf"), Crypto.Exchange.binance],
        .SKY: [(Crypto.whitePaperTitle, "https://medium.com/skycoin/skycoin-whitepaper-tl-dr-f8e84dcd0d98"), Crypto.Exchange.binance],
        .GNT: [(Crypto.whitePaperTitle, "https://golem.network/crowdfunding/Golemwhitepaper.pdf"), Crypto.Exchange.binance],
        .VIB: [(Crypto.whitePaperTitle, "https://vibehub.io/VibeHubWhitepaper2017.pdf"), Crypto.Exchange.binance],
        .TNB: [(Crypto.whitePaperTitle, "https://tnb.fund/pdf/TNB_business_white_paper_en.pdf"), Crypto.Exchange.binance],
        .STORJ: [(Crypto.whitePaperTitle, "https://storj.io/storj.pdf"), Crypto.Exchange.binance],
        .WRP: [(Crypto.whitePaperTitle, "https://www.wingate.com/resources/WG/WRP_comparison.html"), Crypto.Exchange.binance],
        .MDA: [(Crypto.whitePaperTitle, "https://moeda.in/whitepaper.pdf"), Crypto.Exchange.binance],
        .AE: [(Crypto.whitePaperTitle, "https://github.com/aeternity/protocol"), Crypto.Exchange.binance],
        .MCO: [(Crypto.whitePaperTitle, "https://crypto.com/mco_whitepaper.pdf"), Crypto.Exchange.binance],
        .PPT: [(Crypto.whitePaperTitle, "https://cryptorating.eu/whitepapers/Populous/populous_whitepaper.pdf"), Crypto.Exchange.binance],
        .ARK: [(Crypto.whitePaperTitle, "https://request.network/assets/pdf/request_whitepaper.pdf"), Crypto.Exchange.binance],
        .GXS: [(Crypto.whitePaperTitle, "https://github.com/gxchain/whitepaper/blob/master/en/whitepaper.md"), Crypto.Exchange.binance],
        .POA: [(Crypto.whitePaperTitle, "https://github.com/poanetwork/wiki/wiki/POA-Network-Whitepaper"), Crypto.Exchange.binance],
        .ELF: [(Crypto.whitePaperTitle, "https://aelf.io"), Crypto.Exchange.binance],
        .WAVES: [(Crypto.whitePaperTitle, "https://blog.wavesplatform.com/waves-whitepaper-164dd6ca6a23"), Crypto.Exchange.binance],
        .THETA: [(Crypto.whitePaperTitle, "https://s3.us-east-2.amazonaws.com/assets.thetatoken.org/Theta-white-paper-latest.pdf"), Crypto.Exchange.binance],
        .AST: [(Crypto.whitePaperTitle, "https://swap.tech/whitepaper/"), Crypto.Exchange.binance],
        .CMT: [(Crypto.whitePaperTitle, "https://www.cybermiles.io/vision/"), Crypto.Exchange.binance],
        .RPX: [(Crypto.whitePaperTitle, "https://medium.com/@verneri/red-pulse-rpx-the-first-token-for-neo-platform-what-is-it-and-will-it-be-successful-in-2018-6fedfbdaa16e"), Crypto.Exchange.binance],
        .BCD: [(Crypto.whitePaperTitle, "https://www.bcdiploma.com/ico/img/BCD-WhitePaper_last.pdf"), Crypto.Exchange.binance],
        .DATA: [(Crypto.whitePaperTitle, "https://s3.amazonaws.com/streamr-public/streamr-datacoin-whitepaper-2017-07-25-v1_0.pdf"), Crypto.Exchange.binance],
        .LSK: [(Crypto.whitePaperTitle, "https://whitepaperdatabase.com/lisk-lsk-whitepaper/"), Crypto.Exchange.binance],
        .BTS: [(Crypto.whitePaperTitle, "https://bravenewcoin.com/assets/Whitepapers/bitshares-financial-platform.pdf"), Crypto.Exchange.binance],
        .PIVX: [(Crypto.whitePaperTitle, "https://pivx.org/white-papers/"), Crypto.Exchange.binance],
        .TRIG: [(Crypto.whitePaperTitle, "https://www.blocksafefoundation.com/assets/blocksafe_whitepaper_v.1.pdf"), Crypto.Exchange.binance],
        .SYS: [(Crypto.whitePaperTitle, "https://syscoin.org/Syscoin_3.0_Whitepaper__Condensed.pdf"), Crypto.Exchange.binance],
        .AMB: [(Crypto.whitePaperTitle, "https://crushcrypto.com/wp-content/uploads/2017/09/AMB-Whitepaper.pdf"), Crypto.Exchange.binance],
        .LEND: [(Crypto.whitePaperTitle, "https://ethlend.io"), Crypto.Exchange.binance],
        .DNT: [(Crypto.whitePaperTitle, "https://district0x.io/docs/district0x-whitepaper.pdf"), Crypto.Exchange.binance],
        .HSR: [(Crypto.whitePaperTitle, "https://h.cash/themes/en/images/Hcash+Whitepaper+V0.8.5.pdf"), Crypto.Exchange.binance],
        .APPC: [(Crypto.whitePaperTitle, "https://appcoins.io/pdf/appcoins_whitepaper.pdf"), Crypto.Exchange.binance],
        .KNC: [(Crypto.whitePaperTitle, "https://kyber.network"), Crypto.Exchange.binance],
        .CND: [(Crypto.whitePaperTitle, "https://cindicator.com/Cindicator_WhitePaper_en.pdf"), Crypto.Exchange.binance],
        .CHAT: [(Crypto.whitePaperTitle, "http://www.openchat.co/whitepaper/oc_wp.pdf"), Crypto.Exchange.binance],
        .GAS: [(Crypto.whitePaperTitle, "http://docs.neo.org/en-us/whitepaper.html"), Crypto.Exchange.binance],
        .FUN: [(Crypto.whitePaperTitle, "https://funfair.io/wp-content/uploads/FunFair-Commercial-White-Paper.pdf"), Crypto.Exchange.binance],
        .REQ: [(Crypto.whitePaperTitle, "https://request.network/assets/pdf/request_whitepaper.pdf"), Crypto.Exchange.binance],
        .OAX: [(Crypto.whitePaperTitle, "https://www.oax.org/assets/whitepaper/openANX_White_Paper_ENU.pdf"), Crypto.Exchange.binance],
        .NEBL: [(Crypto.whitePaperTitle, "https://nebl.io/wp-content/uploads/2017/07/NeblioWhitepaper.pdf"), Crypto.Exchange.binance],
        .OST: [(Crypto.whitePaperTitle, "https://ost.com/documents"), Crypto.Exchange.binance],
        .QLC: [(Crypto.whitePaperTitle, "https://crushcrypto.com/wp-content/uploads/2017/11/QLC-Whitepaper.pdf"), Crypto.Exchange.binance],
        .FUEL: [(Crypto.whitePaperTitle, "https://crushcrypto.com/wp-content/uploads/2017/11/QLC-Whitepaper.pdf"), Crypto.Exchange.binance],
        .SNM: [(Crypto.whitePaperTitle, "https://sonm.com"), Crypto.Exchange.binance],
        .NAV: [(Crypto.whitePaperTitle, "https://navcoin.org"), Crypto.Exchange.binance],
        .XZC: [(Crypto.whitePaperTitle, "https://zcoin.io/tech/"), Crypto.Exchange.binance],
        .ICN: [(Crypto.whitePaperTitle, "https://docs.icon.foundation/ICON-Whitepaper-EN-Draft.pdf"), Crypto.Exchange.binance],
        .LRC: [(Crypto.whitePaperTitle, "https://loopring.org"), Crypto.Exchange.binance],
        .YOYO: [(Crypto.whitePaperTitle, "https://yoyow.org/files/white-paper3_en.pdf"), Crypto.Exchange.binance],
        .DLT: [(Crypto.whitePaperTitle, "https://docs.agrello.org/Agrello-Self-Aware_Whitepaper-English.pdf"), Crypto.Exchange.binance],
        .BCN: [(Crypto.whitePaperTitle, "https://bytecoin.org/old/whitepaper.pdf"), Crypto.Exchange.binance],
        .WABI: [(Crypto.whitePaperTitle, "https://bytecoin.org/old/whitepaper.pdf"), Crypto.Exchange.binance],
        .VIBE: [(Crypto.whitePaperTitle, "https://vibehub.io/VibeHubWhitepaper2017.pdf"), Crypto.Exchange.binance],
        .CLOAK: [(Crypto.whitePaperTitle, "https://www.cloakcoin.com/en/whitepaper"), Crypto.Exchange.binance],
        .RDN: [(Crypto.whitePaperTitle, "https://raiden.network"), Crypto.Exchange.binance],
        .RLC: [(Crypto.whitePaperTitle, "https://iex.ec/whitepaper/iExec-WPv3.0-English.pdf"), Crypto.Exchange.binance],
        .WPR: [(Crypto.whitePaperTitle, "https://wepower.network"), Crypto.Exchange.binance],
        .MOD: [(Crypto.whitePaperTitle, "https://modum.io/sites/default/files/documents/2018-05/modum-whitepaper-v.-1.0.pdf"), Crypto.Exchange.binance],
        .DGD: [(Crypto.whitePaperTitle, "https://bravenewcoin.com/assets/Whitepapers/digixdao-info.pdf"), Crypto.Exchange.binance],
        .TNT: [(Crypto.whitePaperTitle, "https://tokensale.tierion.com/TierionTokenSaleWhitePaper.pdf"), Crypto.Exchange.binance],
        .EVX: [(Crypto.whitePaperTitle, "https://www.everex.io"), Crypto.Exchange.binance],
        .BNT: [(Crypto.whitePaperTitle, "https://storage.googleapis.com/website-bancor/2018/04/01ba8253-bancor_protocol_whitepaper_en.pdf"), Crypto.Exchange.binance],
        .SNGLS: [(Crypto.whitePaperTitle, "https://coss.io/documents/white-papers/singulardtv.pdf"), Crypto.Exchange.binance],
        .NANO: [(Crypto.whitePaperTitle, "https://nano.org/en/whitepaper"), Crypto.Exchange.binance],
        .MTH: [(Crypto.whitePaperTitle, "https://ico.monetha.io/Monetha_WP.pdf"), Crypto.Exchange.binance],
        .VIA: [(Crypto.whitePaperTitle, "https://whitepaperdatabase.com/viacoin-via-whitepaper/"), Crypto.Exchange.binance],
        .LUN: [(Crypto.whitePaperTitle, "https://bravenewcoin.com/assets/Whitepapers/Lunyr-WhitePaper-ENG.pdf"), Crypto.Exchange.binance]
    ]
}

extension Crypto {
    static let twitterHandle: [Crypto: [String]] = [
        .ETH: ["ethereum"],
        .BTC: ["BitcoinMagazine"], //@Bitcoin tweets BCH
        .EOS: ["EOS_io"],
        .XLM: ["StellarOrg"],
        .IOST: ["IOStoken"],
        .BCC: ["bitconnect"],
        .TRX: ["justinsuntron"],
        .BNB: ["binance"],
        .ADA: ["Cardano","CardanoStiftung"],
        .XRP: ["Ripple"],
        .QKC: ["Quark_Chain"],
        .NEO: ["NEO_Blockchain","NEOnewstoday"],
        .LTC: ["ltc","TheLTCnews"],
        .ICX: ["icx_official"],
        .ARN: ["aeron_aero"],
        .ZRX: ["0xProject"],
        .ZIL: ["zilliqa"],
        .KEY: ["thekeyvip"],
        .NPXS: ["PundiXLabs"],
        .ONT: ["OntologyNetwork"],
        .IOTA: ["iotatoken","iotatokennews"],
        .ETC: ["eth_classic"],
        .TUSD: ["Tether_to"],
        .REP: ["AugurProject"],
        .NAS: ["nebulasio"],
        .ADX: ["AdEx_Network"],
        .BAT: ["AttentionToken"],
        .XMR: ["monero"],
        .HOT: ["holochain"],
        .DASH: ["Dashpay"],
        .XVG: ["vergecurrency"],
        .GTO: ["gifto_io"],
        .IOTX: ["iotex_io"],
        .INS: ["INS_Ecosystem"],
        .VEN: ["vechainofficial"],
        .WAN: ["wanchain_org"],
        .DENT: ["dentcoin"],
        .LINK: ["chainlink"],
        .KMD: ["KomodoPlatform"],
        .LOOM: ["loomnetwork"],
        .STRAT: ["stratisplatform"],
        .SNT: ["ethstatus"],
        .GVT: ["genesis_vision"],
        .ZEC: ["zcashco"],
        .MFT: ["Mainframe_HQ"],
        .STORM: ["Storm_Token"],
        .WTC: ["Waltonchain"],
        .ENJ: ["enjin"],
        .BQX: ["Ethos_io"],
        .ARDR: ["ArdorPlatform"],
        .ENG: ["EnigmaMPC"],
        .NULS: ["nulsservice"],
        .NCASH: ["NucleusVision"],
        .GRS: ["GroestlcoinTeam"],
        .ZEN: ["zencash_io"],
        .SC: ["SiaCoinSCToday"],
        .AION: ["Aion_Network"],
        .QTUM: ["QtumOfficial"],
        .EDO: ["eidoo_io"],
        .CVC: ["civickey"],
        .QSP: ["Quantstamp"],
        .SUB: ["SubstratumNet"],
        .MTL: ["metalpaysme"],
        .BTG: ["bitcoingold"],
        .MANA: ["decentraland"],
        .NXS: ["NxsEarth"],
        .CDT: ["coindashio"],
        .BRD: ["BRDHQ"],
        .STEEM: ["SteemNetwork"],
        .BLZ: ["BluzelleHQ"],
        .RCN: ["RCN_token"],
        .POE: ["_poetproject"],
        .BCPT: ["blockmasonio"],
        .OMG: ["omise_go"],
        .XEM: ["NEMofficial"],
        .POWR: ["PowerLedger_io"],
        .WINGS: ["wingsplatform"],
        .AGI: ["singularity_net"],
        .SALT: ["SaltLending"],
        .SKY: ["Skycoinproject"],
        .GNT: ["golemproject"],
        .VIB: ["Viberate_com"],
        .TNB: ["TimeNewBank"],
        .STORJ: ["storjproject"],
        .WRP: ["ForbesCrypto"], // no twitter
        .MDA: ["moedaseeds"],
        .AE: ["aeternity"],
        .MCO: ["MCO_Crypto"],
        .PPT: ["BitPopulous"],
        .ARK: ["ArkEcosystem"],
        .GXS: ["gongxinbao"],
        .POA: ["poanetwork"],
        .ELF: ["aelfblockchain"],
        .WAVES: ["wavesplatform"],
        .THETA: ["ThetaToken"],
        .AST: ["airswap"],
        .CMT: ["cybermiles"],
        .RPX: ["red_pulse_china"],
        .BCD: ["BitcoinDiamond_"],
        .DATA: ["Blockchain_Data"],
        .LSK: ["LiskHQ"],
        .BTS: ["bitshares"],
        .PIVX: ["_pivx"],
        .TRIG: ["blocksafe"],
        .SYS: ["syscoin"],
        .AMB: ["AmbrosusAMB"],
        .LEND: ["ethlend1"],
        .DNT: ["district0x"],
        .HSR: ["HcashOfficial"],
        .APPC: ["AppCoinsProject"],
        .KNC: ["KyberNetwork"],
        .CND: ["Crowd_indicator"],
        .CHAT: ["ForbesCrypto"], //no twitter
        .GAS: ["NEO_Blockchain"],
        .FUN: ["FunFairTech"],
        .REQ: ["RequestNetwork"],
        .OAX: ["OAX_Foundation"],
        .NEBL: ["NeblioTeam"],
        .OST: ["OSTdotcom"],
        .QLC: ["ForbesCrypto"],  //no twitter
        .FUEL: ["etherparty_com"],
        .SNM: ["sonmdevelopment"],
        .NAV: ["NavCoin"],
        .XZC: ["zcoinofficial"],
        .ICN: ["iconominet"],
        .LRC: ["loopringorg"],
        .YOYO: ["InfoYoyow"],
        .DLT: ["AgrelloOfficial"],
        .BCN: ["Bytecoin_BCN"],
        .WABI: ["wabiico"],
        .VIBE: ["VibeHubVR"],
        .CLOAK: ["CloakCoin"],
        .RDN: ["raiden_network"],
        .RLC: ["iEx_ec"],
        .WPR: ["WePowerN"],
        .MOD: ["modum_io"],
        .DGD: ["DigixGlobal"],
        .TNT: ["Tierion"],
        .EVX: ["everexio"],
        .BNT: ["bancornetwork"],
        .SNGLS: ["SingularDTV"],
        .NANO: ["nano"],
        .MTH: ["Monetha_io"],
        .VIA: ["viacoin"],
        .LUN: ["LunyrInc"]
    ]
}

extension Crypto {
    static let binanceFetchSymbols: [String: [String]] = [
        // blank arrays can be translated into dollars by BTC
        "ETH": ["ETHUSDT"],
        "BTC": ["BTCUSDT"],
        "EOS": ["EOSUSDT"],
        "XLM":["XLMUSDT"],
        "IOST":[],
        "BCC":["BCCUSDT"],
        "TRX":["TRXUSDT"],
        "BNB":["BNBUSDT"],
        "ADA":["ADAUSDT"],
        "XRP":["XRPUSDT"],
        "QKC":[],
        "NEO":["NEOUSDT"],
        "LTC":["LTCUSDT"],
        "ICX":["ICXUSDT"],
        "ARN":[],
        "ZRX":[],
        "ZIL":[],
        "KEY":[],
        "NPXS":[],
        "ONT":["ONTUSDT"],
        "IOTA":["IOTAUSDT"],
        "ETC":["ETCUSDT"],
        "TUSD":["TUSDUSDT"],
        "REP":[],
        "NAS":[],
        "ADX":[],
        "NANO":[],
        "BAT":[],
        "XMR":[],
        "HOT":[],
        "DASH":[],
        "XVG":[],
        "GTO":[],
        "IOTX":[],
        "INS":[],
        "VEN":[],
        "WAN":[],
        "DENT":[],
        "LINK":[],
        "KMD":[],
        "LOOM":[],
        "STRAT":[],
        "SNT":[],
        "GVT":[],
        "ZEC":[],
        "MFT":[],
        "STORM":[],
        "WTC":[],
        "ENJ":[],
        "BQX":[],
        "ARDR":[],
        "ENG":[],
        "NULS":["NULSUSDT"],
        "NCASH":[],
        "GRS":[],
        "ZEN":[],
        "SC":[],
        "AION":[],
        "QTUM":[],
        "EDO":[],
        "CVC":[],
        "QSP":[],
        "SUB":[],
        "MTL":[],
        "BTG":[],
        "MANA":[],
        "NXS":[],
        "CDT":[],
        "BRD":[],
        "STEEM":[],
        "BLZ":[],
        "RCN":[],
        "POE":[],
        "BCPT":[],
        "OMG":[],
        "XEM":[],
        "POWR":[],
        "WINGS":[],
        "AGI":[],
        "SALT":[],
        "SKY":[],
        "GNT":[],
        "VIB":[],
        "TNB":[],
        "STORJ":[],
        "WRP":[],
        "MDA":[],
        "AE":[],
        "MCO":[],
        "PPT":[],
        "ARK":[],
        "GXS":[],
        "POA":[],
        "ELF":[],
        "WAVES":[],
        "THETA":[],
        "AST":[],
        "CMT":[],
        "RPX":[],
        "BCD":[],
        "DATA":[],
        "LSK":[],
        "BTS":[],
        "PIVX":[],
        "TRIG":[],
        "SYS":[],
        "AMB":[],
        "LEND":[],
        "DNT":[],
        "HSR":[],
        "APPC":[],
        "KNC":[],
        "CND":[],
        "CHAT":[],
        "GAS":[],
        "FUN":[],
        "REQ":[],
        "OAX":[],
        "NEBL":[],
        "OST":[],
        "QLC":[],
        "FUEL":[],
        "SNM":[],
        "NAV":[],
        "XZC":[],
        "ICN":[],
        "LRC":[],
        "YOYO":[],
        "DLT":[],
        "BCN":[],
        "WABI":[],
        "VIBE":[],
        "CLOAK":[],
        "RDN":[],
        "RLC":[],
        "WPR":[],
        "MOD":[],
        "DGD":[],
        "TNT":[],
        "EVX":[],
        "BNT":[],
        "SNGLS":[],
        "MTH":[],
        "VIA":[],
        "LUN":[]
    ]
}

// caseiterable protocol from https://stackoverflow.com/questions/24007461/how-to-enumerate-an-enum-with-string-type
protocol CaseIterable {
    associatedtype AllCases: Collection where AllCases.Element == Self
    static var allCases: AllCases { get }
}
extension CaseIterable where Self: Hashable {
    static var allCases: [Self] {
        return [Self](AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            var first: Self?
            return AnyIterator {
                let current = withUnsafeBytes(of: &raw) { $0.load(as: Self.self) }
                if raw == 0 {
                    first = current
                } else if current == first {
                    return nil
                }
                raw += 1
                return current
            }
        })
    }
}
