require 'socket'

# Load target server ip and port from ENV
$ip, $port = ENV['GCP_RubyHost'].split(':')
$ip = 'localhost' if ARGV.any?{|a| a == '-l'}


# Send request to server
def send_msg(code)
  s = TCPSocket.new($ip, $port)
  s.puts("GETGFT?#{code}")
  p s.gets.chomp
end

print("Enter your gift code: ")
code = STDIN.gets.chomp # retrive user input
send_msg(code)


# Valid code list
%{
  # ↓ prefix of code
  Ihpot

  # ↓ random hash of code
  bead75fb05
  c8e0ea0ade
  4cb6af9303
  5f50f231f0
  b58b08e355
  f1d9b91f0f
  e2fdd0f9c0
  5acdab261b
  0c289a312a
  188f9c5bbf
  2b2f110251
  a2a83a471c
  31f5a3d7f7
  bbbfaaf7a9
  98ad8b1956
  cea02558cd
  48ef3bc6d0
  191db75769
  23dfd7ddeb
  13ef1f22ec
  9919a873f1
  828915b573
  e75133c148
  fe014d3a68
  60d2ebb149
  406e2e743b
  7c8d244b90
  d96ab4ef77
  b8f810632e
  28d847469f
  3d4bc0ea82
  1bc555d838
  11f4a9b18d
  cba2b249c7
  27adc8beac
  48d3ff837d
  4f44ee2d85
  65bf70adc9
  835bab090d
  43e7d49beb
  3144c06a85
  55e9bbe097
  6339cf8072
  a04501e80f
  9e884b35ca
  669244a6c3
  02ac86ebd7
  b6f1c462a4
  e970e6e23d
  c77cdde144
  5cce6066ed
  de9606e735
  7b0780a0b0
  74e4e0d029
  1f349ad0e2
  fb09f8adb7
  047f8cf202
  baad552619
  8518891fa7
  f2eda1f2d4
  c4b472b235
  15e63cd440
  8dbab41d41
  5f428e3530
  78b6887b46
  cd67d67d04
  952ab2de5f
  4fd8cfe50e
  21d262931d
  ae38066c43
  19215f12cb
  09fb123198
  649718d4ad
  0594017858
  5399f8f0e9
  2f8021001c
  0d1d6dc9c9
  ddbac0fe7c
  f964055527
  24c770476a
  34ebac6703
  e9a4bb8ff3
  2301ce04aa
  e2a831655c
  410e0d7983
  f9ab95fe2e
  18c22a1f65
  97d5e4371f
  38e3d44ba6
  7b68892f86
  1cad9d5ecd
  759fc7b324
  5567f349f6
  217e404411
  6d44f97ebb
  ee5cbdcddd
  32bc73b42d
  2e7d099439
  1594346cb9
  7140e32aab
  88195538d6
  e8a06fdb8b
  087fd2c850
  e01436948a
  2b5210e338
  5808255666
  8cec07c290
  a36b4cbd54
  dada5cf596
  a49f74b6e1
  4a826575be
  fc77d4b649
  02eace754e
  a891e4a1cd
  6b3228031b
  aaa7ec79a1
  dd7b502ede
  8c235f077d
  81c722f9a0
  0804d63f1a
  7e94eacdde
  5d7ce552ca
  4947a9cbc5
  d84541dc01
  21c7622312
  441c6d74cc
  ca93fc7d27
  005ff3129c
  8d422a1488
  aa6293ab35
  217ab0992f
  f7729c5645
  a353da483c
  e92d7cce43
  30fcbe83f4
  6ac7ad232b
  a79bd2a559
  f151e93229
  c46861b457
  c584e968ca
  a6d5c237ba
  5fcdbde33a
  bcb7052383
  96e46d40ce
  3fb4aeef55
  530264a7f5
  8cdd837f28
  cb51727855
  ca38b66530
  d539a75d9b
  278b56123d
  a5272c0e91
  fa1cb4aa99
  2281ff9c27
  04f7d8cd8f
  4dc3293648
  c3868fee40
  19cbabf274
  180a9dce63
  5872f25d7c
  70a2bec29c
  f3b66f2e9a
  785dd09b34
  8b0b1c510f
  f87f30370b
  9c4ea17a37
  9433c8a6ff
  ff5ab571db
  48c4224905
  21e672e521
  23e514dbb3
  94b8cc3186
  676abd0e82
  5b8646aec6
  436651dba4
  b9c23938a6
  0b7f1b2f85
  f34af3ab70
  c088ab8814
  3c66b6a95e
  5e89c54b37
  8b425378bb
  e4a8500df7
  ddaa481d70
  431d63ab27
  130c685ca0
  568b903f2b
  b1e535322d
  916fff5924
  45a116780a
  51767b7e2c
  d74f979fce
  fae491b902
  7448390271
  a9abfb6a4b
  14b7c3bcae
  fa93c95661
  0cb70e51a8
  0a12a3039e
  4fa3011c65
  f32fc3b75e
  1d9d05b1f8
  62be0cd1e4
  bbabf32e29
  60f0121095
  583d6ba56b
  3346af184c
  20c4b221d2
  ed8ba6bfcf
  bd9c81145b
  d1dc139e99
  91adc1881c
  14e87f6798
  94f251a3e5
  20d0a765b8
  b6d5a94964
  cad90b9444
  8eda27ff80
  833f67257a
  8da56c66b1
  855b9ddceb
  26891c598e
  f5f1c157b7
  eeaa270a86
  6301198527
  95d005aaaf
  fc1909d8b0
  76ccb1ac40
  e1e00aca85
  f6307c7b80
  2a5e1ae3a7
  eb9010c55f
  c7870becbf
  2b8ef5228b
  336163c700
  544f421453
  ae844573a3
  424b09c74a
  e420a243ee
  e7c737cc81
  9c2543b55b
  faaef1a3b6
  b69580cac4
  7547438ec4
  69c07a03c7
  83eabbf8ae
  5f31bffd44
  5431c7c7f6
  d37d51cdae
  7aeb7c33ba
  0a907266f3
  b65db46bd7
  41b890d8c0
  118e0c561d
  c12ae53e7a
  1bdbfca7da
  b5b20c4897
  1deb757ac7
  92dd7bb0fd
  adb77421b0
  2d1fd3c4fa
  bec6979ea0
  6ec6501a54
  a49002bbc0
  779ae3c75f
  280fe8cb51
  66436fdfd2
  12cc094eb5
  5e60b838c9
  c7662c5491
  71148db13c
  034d91e3a7
  6a1520bd12
  0beb9ca93d
  9e920c8562
  ef9d61131d
  00d469fd1c
  7b5ab01c9b
  f1efbd34b3
  bd3a834f2a
  c7d5fedadb
  40cc3eb79c
  54dcaef76c
  faf3ec6c34
  2ef9937640
  e4219c3e23
  44b7c31870
  2fc59d4931
  bbf8124cc5
  30521d7b49
  b0a46c3914
  ca7b55123e
  3210498bdd
  4ffa46baa1
  068bcd21c8
  ed629cfa07
  4eaab8b524
  9714666531
  5e3ca95ca5
  96d8f9a676
  e9f4e4aed0
  8c7530ca33
  57efd80e06
  2f941deb8b
  6b7816128b
  97d8cbf7d2
  e4c756cc63
  bedecd2f40
  030c705add
  30a9f65a1c
  34e54dc210
  e311a14fb3
  7dfc10b0cc
  39258551d6
  e0be4816b8
  5a31db71e3
  aea290b7f5
  025765a339
  21afc61f3e
  7b975c77c4
  b2220f9b53
  852bb9560e
  1655290934
  1d5275d4a3
  e3fb448a1b
  b4cb76eff1
  2ae42aada8
  485ac0a369
  573b0b19bc
  c78d56a2ed
  2c85697080
  2d1b4dd75f
  9b752acf03
  a769a50da6
  e43b9f3fe4
  9bce91ad26
  7e502bf9f5
  05e5707cc5
  c6a4b0b7d6
  21e8b924cb
  29adbc09a3
  e1b8275ec3
  c6f94cfed5
  d9d8e3b850
  fb9c6c0655
  55c72aca3a
  f51e89d9c7
  ec0e778a6d
  1e48999050
  35e26df76f
  77e0379321
  9036f4ec81
  f9bf2bc03b
  6f6f9b9842
  277a5a1bb5
  d4a4c87532
  480a50b75a
  b0d299285c
  33fa27687d
  f70d4e1638
  584b7937e6
  0faa56818c
  ed3195f7d0
  45d472d635
  e713e2aba6
  8b913b5163
  f2109582fd
  2e8f23aad4
  604418ad5b
  4fb49508fd
  a73386d659
  e61c1a92dc
  162a4bd1f9
  3dbaf57927
  904344f3d3
  9d19e5e68b
  693a503ad9
  5466f24478
  ca937f621d
  a1c129b38d
  2f70de7f13
  1fa316403a
  26edb3d968
  e57539e827
  5cc8ff1579
  85be943655
  fb28d467d7
  2b3c9a5827
  79c7e844a5
  0aba8df1cd
  a682346bd2
  b0d01fb56a
  916f69c8c4
  e7acbba849
  4434f71701
  5089052c74
  cbd3123777
  7769f38478
  13ef97e0f7
  d3af6a94b5
  73d4d4ef7d
  8d48359f7e
  ed52ba2a50
  dcf9c83442
  1fe963b88e
  3ae2b3a27b
  0ff87389ec
  f1010a9e75
  0492fe6293
  0e0ba5bcf8
  04058d515a
  19686136ef
  56c847ba90
  ff4ddd696e
  d8686aaf07
  2fbdf1aea3
  b67436ae7a
  7c04acf7c8
  9e11c5abb4
  f843615920
  b93c366d37
  d565df1c8b
  ad33221463
  9fc501f875
  8f5665701d
  5ec115d9b8
  9929b75f17
  2d70f7e532
  de67d0acb4
  d0051cb67f
  7e0b402667
  382c4afdfd
  e1d8d33b44
  e2a106e625
  8b6a014374
  166d5ac4d3
  021defd750
  78ae34b0dd
  6438132729
  28cfd71f42
  1a30849739
  05e39ebe22
  15b48a9dc1
  17aeb1fc1d
  bcd8a19db2
  7c01bc4a19
  c2c2740a5b
  9c4d80397b
  ceaa9355fe
  22cbe53a61
  d91ee49898
  1f9a1c0027
  70f93392dc
  2bb0713b3a
  fe483e94e1
  050f20112e
  ff68164700
  1cc56b04bd
  d11a60d4bc
  4cf3578d5c
  4e4cef7703
  4e89032c05
  ba950b6d6c
  813fdc37bd
  3f7c80eff0
  69639faf6b
  751bc2d99f
  5eb22bd6a9
  e2e237b47e
  f892163a64
  8a23fa3671
  819f58a0a4
  32f480ddc6
  1e7f0cf13f
  467305af0c
  677fbc12ae
  48e1a4e65a
  57d0175a0c
  3e84ac1e79
  ff0a75cca4
  7af87cbc28
  2b324953e8
  c4c7b812cb
  10ef695c21
  ed35a46283
  9347416bc9
  1999ccee77
  e015355050
  86a681e6b2
  56083cfe1f
  a1c7493721
  c48d0dfafd
  74a48c31ca
  12f9e9c9f1
  629a1d7d3f
  39be67a5fd
  c2d6a7d06d
  c8d5d2eb01
  e805464870
  03b12b392a
  62ad8fa19e
  2ce8ddf1e6
  0957a58184
  593fa553fd
  79c1ff3ca1
  7ec9bd1f6c
  418bd7b5d7
  2fd8d3531c
  41242453a2
  90b68a9c67
  25b492a592
  092dba7727
  b764370ab9
  1cf106d28f
  f8211d412e
  9f0cdb136f
  d81f3507c0
  492d1ff20d
  55fefce9cd
  6d2b60fcc8
  f44c16bc84
  4d58050c98
  140e7144af
  0b84f3debd
  8ef989d60b
  f26f5f9cab
  76159ab48a
  fe753e654c
  26cb9c9694
  7bf9cfaf5c
  427549ee81
  7e4dfa0a4b
  731cb0289e
  ee3728c135
  229c0dd5a2
  998e98619b
  6033062b66
  1fb58dd7ec
  d4d10e2854
  9c1576d5f5
  8ff88df8d4
  855f9179bb
  36f03a8aac
  6132e64564
  57c018b9cd
  dfe5ada58b
  b97cea6eaf
  a852e8c8a4
  820bf400b2
  66bf21b0d5
  38b3b4620f
  4fba95c1c5
  fcc574610c
  2ee6608b08
  a6a008d3f0
  2976a7c119
  dcb3481637
  0b06034148
  5b6ae67f1b
  59ec381ad1
  ad864df515
  d9f2966e1b
  5d4e2c6a8c
  38d5a8a30c
  b698a05064
  dc4136d854
  e250f03311
  68f7f4d590
  3826cec6c0
  82c6c8264e
  9d6b5d5cd3
  73452b1d48
  e61d2588d8
  631b124d9d
  2d676ca5ed
  005a348291
  0539303e6f
  bdc12210b3
  37930a6751
  3fb3c150dd
  e6cf66da3a
  f834ffd05b
  fd427d2241
  0bda97d50d
  b7b65aba1e
  664f2faa83
  5349f09f71
  d68f54de6b
  ea7991c8a0
  ef08d6ecad
  5ac6bbbba8
  b94049a329
  f67ec5244d
  b80e1c98a9
  cd7b5dce92
  9ad3d5a293
  4e55f51571
  4e6dd417e4
  893d2e66bd
  f172ebeecb
  752875218f
  fc63ee3a52
  fd3939dce5
  feef09ea21
  0bba5ce718
  5dd3425359
  2b0beca713
  94a4c33efc
  66fe2310e4
  73a5f3bfae
  b3798f98ef
  66ff565f39
  a9fdeacd9a
  165a740aa7
  0aeb6410c4
  a89888ef4f
  2634d3b43f
  d1394424e6
  df6a67e0fa
  cdec7df693
  354b1809b3
  dab4b6b1b5
  767b15e883
  552c866b25
  ac95a993b7
  e898335373
  30ffe80232
  47b5c35209
  ecb7b08f57
  7df99d8cac
  5f70ecd3c8
  284f4414fe
  cf1cde442c
  cb02027d0d
  3db12e9096
  ec431da23d
  fbe30e1bec
  5298bc1b5c
  73ffe1f124
  d519edf24d
  f911bb913f
  1a687f9b20
  7f3db748b5
  d0fe838b89
  40d1973d25
  6c98e31606
  1fe4b9a360
  afb9603bc5
  8c24e7925a
  cdeffe88d4
  120353f4ae
  29843ba38b
  b865b5023f
  92882f0ca4
  5081cf9839
  9231a396ef
  95bc398a45
  3c2827c32e
  bb371f54eb
  3e6803500e
  acdc08ea60
  4e80661404
  8b02e04377
  628a7dc92a
  e5b35bb4f7
  01bf01de52
  e1c57a3bf6
  eae60d74d5
  e2cd2b27f4
  783da295b4
  99ea8a7d03
  b9c9ef255f
  1e2fd3d7cb
  ea1342e647
  0ae27caf1d
  abaf1386fc
  e245dc7925
  95ce324ced
  bd33cae517
  f370e55e37
  e2021dae2a
  798dcf3a03
  5333f917ea
  15d3771a63
  cf38e95d2e
  16558cbc33
  624dd71aee
  ba90ed9c74
  fd0a1799e7
  fa38b951aa
  459a40ff5c
  c0873c9115
  bc1b8688df
  6961e50e57
  9e426a2aea
  532dc6e148
  a0113ac0b0
  f5c8e7f665
  be3e925585
  df6fe4d731
  b6589e63b2
  2b46bfdd08
  c089569a98
  60d5cbb572
  86d10bc324
  d828d44beb
  ec6c837466
  8742758d4e
  efc839a07f
  e4ad4c6e2e
  ec6b3b7177
  87ae06e315
  64ea72d936
  3a69e87d0c
  2874156a86
  3102de22f7
  944af5487b
  34784abe7a
  545cbb3757
  ae3c6633ff
  85979b8389
  4c41ea4334
  1253e91463
  f581eefd35
  e1bea360d1
  2717a71f86
  da56c2c7a1
  ab8ae96e75
  036a00d4f7
  077b8ef10b
  e81998588b
  a6e038ffac
  9e229f0a01
  169b740092
  8c9a0908cc
  c65fbe8170
  7d4ab49752
  8a019b7092
  62f3419698
  63f03784c1
  f30bdfddd6
  0dfd638cce
  865b994d14
  40217e6e7d
  78d58f38ea
  606451ddcd
  09ffaadcb1
  8d861dc2af
  70b5063a56
  cd5bcbf360
  c62ba0b091
  95bbd375aa
  ba56800ca2
  b0f19f845e
  b2475773da
  d3229c4f11
  bdddf5a1e3
  7d94ec6644
  3c352f60c4
  4b78091fe2
  9ad11b3afd
  747ec40e33
  6c5b747a0a
  23c4d2710f
  a6562a359c
  7a0f962849
  38e1ddacc2
  a3a47f8fe6
  6d854bff5b
  b2f50e0984
  513b335874
  62d0ff3649
  18eccded28
  16af1d77d7
  104d61480d
  373d261dad
  0957f73761
  17aedb329f
  7b1449b349
  218e4158c0
  71997b029f
  6d2b154233
  07a07fe60a
  ed671d2de7
  8f8589f648
  37377c3261
  aac47e1207
  25ee1ac1b5
  324f243b1b
  c09412ae63
  70f64fed0f
  115774d0d3
  a224add5d8
  00ede6b605
  d8199fd1b0
  1f46afce26
  383aa978d3
  3ef522e729
  d31478e4c4
  73574521f2
  508e9ca886
  1c0f7e25fb
  891353cb99
  fecffe8a16
  fb47505b21
  a120d7a494
  ecbbd6dc3e
  2ce0f85ea6
  803f20e2d2
  e510d81600
  a411296ea2
  4dd904bc10
  398fab83e9
  937be2767d
  386c131097
  3eb93cdb4c
  ca2a956a77
  428ae6fcc9
  82c1c007dc
  b7b374f52a
  b30a76a9e1
  9aa34a762a
  f641cb02e2
  d3b90cb032
  bb20de0494
  a170005a29
  ed53c15c7a
  b8d7a9ce07
  adda38ae54
  6fa2aa06c2
  24072b441b
  5db392d750
  19cd3ce34b
  2fa2b998a8
  ac09da7698
  d43801cc0c
  c7a05fbeda
  1516471afe
  eb1e318cbd
  018ad7ecc5
  60a01ec739
  853cc398ac
  21cf98b68f
  9e37d66eef
  768ec2b232
  015f4a113b
  50e67030f1
  e1dba98a72
  ccf431abbb
  6536aaffca
  00c8c72369
  49a55bd639
  fb3ef1412f
  f74e636694
  6d1f865cff
  248e8fe8f3
  c98713bbdc
  a84ec2ae11
  f271720959
  129f19801e
  3ff084d248
  c6594bb0ec
  f7e4937de4
  7e7283cd09
  83c269795a
  e541301928
  1f02865769
  ace002c07e
  27623ccef6
  aab210dd7b
  a141cf8ac6
  7d9a64abf5
  d7d0bb003b
  72638ba43b
  bd6c6cfa6b
  18f24178f1
  e8b5fc03bb
  1f05c85064
  fe6ca5a94e
  01f2339b56
  5280a0a7e5
  17435ca5c1
  f1d3e67bbc
  3fc9f44bbe
  296a23e308
  c90aa44ab5
  e755e89d47
  fc7769d259
  11793c4e35
  1752e1bc5f
  d8125e2504
  89e470e86b
  2320c3b048
  5731449374
  84cff9077e
  9f826b42af
  63253be6b8
  10d092df07
  ffd3fd73ce
  8c7ac2e976
  3ba3b6ef95
  a583b85653
  40ccf5f2ef
  c5a5848a7d
  b524fe31f2
  1c18b04cac
  e1707493fe
  aa83f110b4
  72d5e94a28
  14a8ffd2c5
  782b2725e5
  d076c9c2bf
  da1cf184e5
  12f246d5eb
  d7bdad9eaa
  33481318e4
  4166429508
  3de40c608a
  6c54b24dd1
  c6f3c23d4d
  437e0369fe
  06a8d179b8
  b7d1497bc7
  9ec1269507
  3a5848863a
  077fc5e357
  37513c9204
  2a4a226730
  53530226fd
  27b31a6410
  b8597d6576
  adc6ca746f
  e87106e487
  3ac31f3836
  19ac8abf88
  8e5b71f594
  ec785fa9b7
  66432e761b
  0d79a528fc
  e62f7fa022
  5b4b6e6e6f
  d0f146a921
  21b77cddc6
  14223fa98a
  ad0aeabf1e
  7fd69da400
  bd3ee343d9
  2ac9b6d2e8
  6f2dc96ab0
  c8980bd3ae
  f2ddb2af74
  e316c1932e
  dae35a809d
  46ff6d1c0b
  11b82ad8e5
  f1d83e0559
  d049675c69
  8a9063449f
  ec9575932e
  57ec5c31be
  3c364e8076
  921120053a
  30e650ec0b
  0be5d05ec5
  e7d80d139c
  545e2e06de
  2980e94dfe
  5ebe6ffe5b
  8d88608341
  cf3c907333
  6337386c9d
  e0aa979c38
  544a689eee
  5a0b0fd8d1
  c2424a5d1d
  c65ef913d7
  327e6011d8
  d262cc5b7e
  a8b126a98d
  e0f5b6442c
  6178e2f545
  9ef7d8f0e6
  2037e2300f
  412b0c7960
  a599f3e255
  1ee0fe4cbe
  17b214da8d
  7d755fd08d
  ace46aacbe
  edf9c08b4c
  69bd1edcc3
  71d64b5a0f
  3050e8ed17
  12076e2def
  e66283bcc8
  2cef3179a9
  9312667248
  3f08f1e797
  b422484636
  a74e38a090
}