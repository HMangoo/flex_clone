import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/page/chat/emblem/emblem_select_page.dart';
import 'package:permission_and_image_load/page/chat/permission/permission_page.dart';
import 'package:permission_and_image_load/page/chat/visual/visual_page.dart';
import 'package:permission_and_image_load/page/chat/widget/button_message.dart';
import 'package:permission_and_image_load/page/chat/widget/text_message.dart';
import 'package:permission_and_image_load/page/chat/widget/two_button_message.dart';

import 'capacity/capacity_page.dart';

void nullFunc() {}

class Message {
  String text;
  bool isSender;

  String buttonMessage;
  String buttonMessage2;

  bool lastQuestion;
  bool isClickFunc;
  VoidCallback firstButtonClickFunc;
  VoidCallback secondButtonClickFunc;

  bool yesOrNoButton;
  bool isMinorColor;

  int numConsentButton;
  bool isUseAnswer;

  var consentText;

  Message(
      {required this.text,
      required this.isSender,
      this.buttonMessage = "",
      this.buttonMessage2 = "",
      this.lastQuestion = false,
      this.isClickFunc = false,
      this.firstButtonClickFunc = nullFunc,
      this.secondButtonClickFunc = nullFunc,
      this.numConsentButton = 0,
      this.consentText = "",
      this.yesOrNoButton = false,
      this.isMinorColor = false,
      this.isUseAnswer = false});
}

List demeChatMessages = [
  Message(text: "반가워요 :)", isSender: false),
  Message(text: "지금부터 플렉스 가입을 도와드릴게요", isSender: false),
  Message(
      text: "어렵지 않으니 잘 따라와주세요!",
      buttonMessage: '네, 알겠어요!',
      isSender: false,
      lastQuestion: true,
      isClickFunc: true),
  Message(text: "네, 알겠어요!", isSender: true),
  Message(text: "플렉스는 싱글들을 위한 서비스에요", isSender: false),
  Message(
      text:
          "당연히 기혼자는 가입을 할 수 없으며, 이를 위반할 시 관련 법령에 따른 민/형사상 고소 등 법적 조치가 취해질 수 있어요",
      isSender: false),
  Message(
      text: "당신은 싱글이신가요?",
      buttonMessage: '네, 싱글이에요',
      isSender: false,
      lastQuestion: true,
      isClickFunc: true),
  Message(text: "네, 싱글이에요!", isSender: true),
  Message(
      text: '플렉스는 국가공인 본인인증 기관인 NICO 평가정보를 통한 100% 철저한 본인인증을 거치고 있어요',
      isSender: false),
  Message(
      text:
          "'신뢰할 수 있는 소통을 위해, 모든 회원의 정확한 실명, 연령, 연락처 인증이 요구되기 때문에 단 하나의 허위 계정도 존재할 수 없으며 타인의 명의 도용이 불가능해요'",
      isSender: false),
  Message(
    text: '본인을 인증해주세요',
    buttonMessage: '본인 인증하기',
    isSender: false,
    lastQuestion: true,
    isClickFunc: true,
  ),
  Message(text: '본인 인증완료!', isSender: true),
  Message(text: "이제 플렉스의 멤버들은 어떤 사람인지 확인해볼까요?", isSender: false),
  Message(
    text: '플렉서가 되기 위한 자격을 확인해주세요',
    buttonMessage: '자격 확인하기',
    isSender: false,
    lastQuestion: true,
    firstButtonClickFunc: () => Get.to(() => const CapacityPage()),
  ),
  Message(text: '확인했어요! 충분히 가능할 것 같아요', isSender: true),
  Message(text: '역시 멋지세요!', isSender: false),
  Message(text: "플렉스 서비스 사용을 위해 꼭 필요한 권한만 요청드리고 있어요", isSender: false),
  Message(
    text: '앱 사용에 필요한 권한을 확인해주세요',
    buttonMessage: '권한 확인하기',
    isSender: false,
    lastQuestion: true,
    firstButtonClickFunc: () => Get.to(() => const PermissionPage()),
  ),
  Message(text: '권한 허용 완료!', isSender: true), // 여기까지 list에 들어있음, 권한 페이지 만들어야함
  Message(text: '이제 마지막으로 이용약관만 확인하면 확인절차는 끝이에요', isSender: false),
  Message(
    text: '플렉서가 되기 위한 약관에 동의해주세요',
    buttonMessage: '완료',
    isSender: false,
    lastQuestion: true,
    numConsentButton: 2,
    consentText: ['서비스 이용약관 동의', '개인정보 보호정책 동의'],
    isClickFunc: true,
  ),
  Message(text: '약관 동의 완료!', isSender: true),
  Message(text: '좋아요! 이제 당신만 접속할 수 있는 계정을 만들거에요', isSender: false),
  Message(text: '주로 사용하는 이메일 주소를 알려주세요', isSender: false, lastQuestion: true),
  Message(
    text: '제대로 입력했는지 한 번 더 확인해주세요',
    buttonMessage: '정확해요!',
    buttonMessage2: '다시 입력할래요',
    yesOrNoButton: true,
    isSender: false,
    lastQuestion: true,
  ),
  Message(text: '정확해요!', isSender: true),
  Message(text: '이번엔 비밀번호를 몰래 입력해주세요', isSender: false, lastQuestion: true),
  Message(text: '제대로 입력했는지 확인해볼까요?', isSender: false, lastQuestion: true),
  Message(
      text: '정확해요! 이제 자신 있는 매력을 인증해야 해요. 신뢰할 수 있는 만남을 위해서는 필수에요',
      isSender: false),
  Message(
    text: '블라인드표시가 된 엠블럼을 신청할 경우, 프로필 사진 없이 가입이 가능하다는 것도 잊지 마세요',
    buttonMessage: '엠블럼 다시보기',
    isSender: false,
    isMinorColor: true,
    firstButtonClickFunc: () => Get.to(() => const CapacityPage()),
  ),
  Message(
    text: '외모에 자신 있다면 비주얼 심사를, 능력에 자신 있다면 서류 심사를 선택해주세요!',
    buttonMessage: '비주얼 심사',
    buttonMessage2: '서류 심사',
    yesOrNoButton: false,
    isSender: false,
    firstButtonClickFunc: () => Get.to(() => const VisualPage()),
    isClickFunc: true,
    lastQuestion: true,
  ),
  Message(text: '멋진 능력을 가지고 계시나봐요! 플렉서들에게 인기가 아주 많을 것 같아요:)', isSender: false),
  Message(text: '플렉스 팀의 서류 검증 시스템으로 당신의 능력에 신뢰와 진정성을 더해드릴게요!', isSender: false),
  Message(
    text: '안내에 따라 당신의 능력을 자랑할 수 있는 엠블럼을 신청해주세요',
    isSender: false,
    lastQuestion: true,
    buttonMessage: '엠블럼 신청하기',
    firstButtonClickFunc: () => Get.to(() => const EmblemSelectPage()),
  ),
  Message(text: '엠블럼 신청 완료!', isSender: true), // 20 - 34
  Message(
      text: '잘 따라와 주셔서 너무 기뻐요 :) 이제 멋진 프로필만 만들면 끝이니까 조금만 더 힘내요!',
      isSender: false),
  Message(text: '당신을 뭐라고 불러드릴까요?', isSender: false, lastQuestion: true),
  Message(text: '정말 멋진 닉네임이에요!', isSender: false, isUseAnswer: true),
  Message(
    text: '지금 사는 곳은 어디신가요?',
    buttonMessage: '거주지 선택하기',
    isSender: false,
    lastQuestion: true,
  ),
];

List<List<Widget>> question = [
  [
    TextMessage(message: demeChatMessages[0]),
    TextMessage(message: demeChatMessages[1]),
    ButtonMessage(message: demeChatMessages[2]),
  ], // 1
  [TextMessage(message: demeChatMessages[3])], //2
  [
    TextMessage(message: demeChatMessages[4]),
    TextMessage(message: demeChatMessages[5]),
    ButtonMessage(message: demeChatMessages[6]),
  ], // 3
  [TextMessage(message: demeChatMessages[7])], // 4
  [
    TextMessage(message: demeChatMessages[8]),
    TextMessage(message: demeChatMessages[9]),
    ButtonMessage(message: demeChatMessages[10]),
  ], // 5
  [TextMessage(message: demeChatMessages[11])], // 6
  [
    TextMessage(message: demeChatMessages[12]),
    ButtonMessage(message: demeChatMessages[13]),
  ], // 7
  [TextMessage(message: demeChatMessages[14])], // 8
  [
    TextMessage(message: demeChatMessages[15]),
    TextMessage(message: demeChatMessages[16]),
    ButtonMessage(message: demeChatMessages[17]),
  ], // 9
  [TextMessage(message: demeChatMessages[18])], // 10
  [
    TextMessage(message: demeChatMessages[19]),
    ButtonMessage(message: demeChatMessages[20]),
  ], // 11
  [TextMessage(message: demeChatMessages[21])], // 12
  [
    TextMessage(message: demeChatMessages[22]),
    TextMessage(message: demeChatMessages[23]),
  ], // 13
  // -> 이메일 입력
  [YesOrNoMessage(message: demeChatMessages[24])], // 14 이메일 확인
  [TextMessage(message: demeChatMessages[25])], // 15 정확해요! (user)
  [TextMessage(message: demeChatMessages[26])], // 16 비밀번호?
  [TextMessage(message: demeChatMessages[27])], // 17 비밀번호 맞나?
  [
    TextMessage(message: demeChatMessages[28]),
    ButtonMessage(message: demeChatMessages[29]),
    YesOrNoMessage(message: demeChatMessages[30])
  ], //18
  [
    TextMessage(message: demeChatMessages[31]),
    TextMessage(message: demeChatMessages[32]),
    ButtonMessage(message: demeChatMessages[33]),
  ], // 19
  [TextMessage(message: demeChatMessages[34])], // 20
  [
    TextMessage(message: demeChatMessages[35]),
    TextMessage(message: demeChatMessages[36])
  ], // 21
  [
    TextMessage(message: demeChatMessages[37]),
    ButtonMessage(message: demeChatMessages[38]),
  ], // 22
];
