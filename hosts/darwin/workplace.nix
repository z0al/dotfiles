{
  my.user.uid = 502;

  my.presets = {
    typescript.enable = true;
    devOps.enable = true;
  };

  # Jamf enforces its own hostname rules, so we can't rely on the
  # default host value
  my.programs.up.target = "workplace";

  my.programs.parallels.enable = false;

  my.programs.claude-code.settings = {
    model = "sonnet";
    awsAuthRefresh = "aws sso login --profile bedrock";
    env = {
      CLAUDE_CODE_USE_BEDROCK = "1";
      AWS_PROFILE = "bedrock";
      AWS_REGION = "eu-west-1";
      ANTHROPIC_DEFAULT_HAIKU_MODEL = "global.anthropic.claude-haiku-4-5-20251001-v1:0";
      ANTHROPIC_DEFAULT_OPUS_MODEL = "global.anthropic.claude-opus-4-7";
      ANTHROPIC_DEFAULT_SONNET_MODEL = "global.anthropic.claude-sonnet-4-6";
    };
  };
}
