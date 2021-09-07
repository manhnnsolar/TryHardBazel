# Copyright 2018 The Tulsi Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# Generated by Tulsi to resolve flags during builds.


import sys


def _StandardizeTargetLabel(label):
  """Convert labels of form //dir/target to //dir/target:target."""
  if label is None:
    return label
  if not label.startswith('//') and not label.startswith('@'):
    sys.stderr.write('[WARNING] Target label "{0}" is not fully qualified. '
                     'Labels should start with "@" or "//".\n\n'.format(label))
    sys.stderr.flush()
  tokens = label.rsplit('/', 1)
  if len(tokens) <= 1:
    return label

  target_base = tokens[0]
  target = tokens[1]

  if '...' in target or ':' in target:
    return label
  return label + ':' + target


class BazelFlags(object):
  """Represents Bazel flags."""

  def __init__(self, startup = [], build = []):
    self.startup = startup
    self.build = build


class BazelFlagsSet(object):
  """Represents a set of Bazel flags which can vary by compilation mode."""

  def __init__(self, debug = None, release = None, flags = None):
    if debug is None:
      debug = flags or BazelFlags()
    if release is None:
      release = flags or BazelFlags()

    self.debug = debug
    self.release = release

  def flags(self, is_debug):
    """Returns the proper flags (either debug or release)."""
    return self.debug if is_debug else self.release


class BazelBuildSettings(object):
  """Represents a Tulsi project's Bazel settings."""

  def __init__(self, bazel, bazelExecRoot,
               defaultPlatformConfigId, platformConfigFlags,
               swiftTargets,
               cacheAffecting, cacheSafe,
               swiftOnly, nonSwiftOnly,
               swiftFeatures, nonSwiftFeatures,
               projDefault, projTargetMap):
    self.bazel = bazel
    self.bazelExecRoot = bazelExecRoot
    self.defaultPlatformConfigId = defaultPlatformConfigId
    self.platformConfigFlags = platformConfigFlags
    self.swiftTargets = swiftTargets
    self.cacheAffecting = cacheAffecting
    self.cacheSafe = cacheSafe
    self.swiftOnly = swiftOnly
    self.nonSwiftOnly = nonSwiftOnly
    self.swiftFeatures = swiftFeatures
    self.nonSwiftFeatures = nonSwiftFeatures
    self.projDefault = projDefault
    self.projTargetMap = projTargetMap

  def features_for_target(self, target, is_swift_override=None):
    """Returns an array of enabled features for the given target."""

    target = _StandardizeTargetLabel(target)
    is_swift = target in self.swiftTargets
    if is_swift_override is not None:
      is_swift = is_swift_override

    return self.swiftFeatures if is_swift else self.nonSwiftFeatures

  def flags_for_target(self, target, is_debug,
                       config, is_swift_override=None):
    """Returns (bazel, startup flags, build flags) for the given target."""

    target = _StandardizeTargetLabel(target)
    target_flag_set = self.projTargetMap.get(target)
    if not target_flag_set:
      target_flag_set = self.projDefault

    is_swift = target in self.swiftTargets
    if is_swift_override is not None:
      is_swift = is_swift_override
    lang = self.swiftOnly if is_swift else self.nonSwiftOnly

    config_flags = self.platformConfigFlags[config]
    cache_affecting = self.cacheAffecting.flags(is_debug)
    cache_safe = self.cacheSafe.flags(is_debug)
    target = target_flag_set.flags(is_debug)
    lang = lang.flags(is_debug)

    startupFlags = []
    startupFlags.extend(target.startup)
    startupFlags.extend(cache_safe.startup)
    startupFlags.extend(cache_affecting.startup)
    startupFlags.extend(lang.startup)

    buildFlags = []
    buildFlags.extend(target.build)
    buildFlags.extend(config_flags)
    buildFlags.extend(cache_safe.build)
    buildFlags.extend(cache_affecting.build)
    buildFlags.extend(lang.build)

    return (self.bazel, startupFlags, buildFlags)

# Default value in case the template does not behave as expected.
BUILD_SETTINGS = None

# Generated by Tulsi. DO NOT EDIT.
BUILD_SETTINGS = BazelBuildSettings(
    '/usr/local/bin/bazel',
    '/private/var/tmp/_bazel_nguyenmanh/798e22d88ebc25e280bac6617bc25c70/execroot/__main__',
    'ios_x86_64',
    {
        'ios_i386': [
            '--apple_platform_type=ios',
            '--cpu=ios_i386',
            '--watchos_cpus=i386',
        ],
        'watchos_x86_64': [
            '--apple_platform_type=watchos',
            '--watchos_cpus=i386',
        ],
        'ios_arm64e': [
            '--apple_platform_type=ios',
            '--cpu=ios_arm64e',
            '--watchos_cpus=armv7k,arm64_32',
        ],
        'tvos_x86_64': [
            '--apple_platform_type=tvos',
            '--tvos_cpus=x86_64',
        ],
        'watchos_armv7k': [
            '--apple_platform_type=watchos',
            '--watchos_cpus=armv7k,arm64_32',
        ],
        'ios_armv7': [
            '--apple_platform_type=ios',
            '--cpu=ios_armv7',
            '--watchos_cpus=armv7k',
        ],
        'tvos_arm64': [
            '--apple_platform_type=tvos',
            '--tvos_cpus=arm64',
        ],
        'macos_arm64': [
            '--apple_platform_type=macos',
            '--cpu=darwin_arm64',
        ],
        'macos_x86_64': [
            '--apple_platform_type=macos',
            '--cpu=darwin_x86_64',
        ],
        'ios_x86_64': [
            '--apple_platform_type=ios',
            '--cpu=ios_x86_64',
            '--watchos_cpus=i386',
        ],
        'ios_arm64': [
            '--apple_platform_type=ios',
            '--cpu=ios_arm64',
            '--watchos_cpus=armv7k,arm64_32',
        ],
        'watchos_i386': [
            '--apple_platform_type=watchos',
            '--watchos_cpus=i386',
        ],
        'watchos_arm64_32': [
            '--apple_platform_type=watchos',
            '--watchos_cpus=armv7k,arm64_32',
        ],
        'macos_arm64e': [
            '--apple_platform_type=macos',
            '--cpu=darwin_arm64e',
        ],
    },
    set([
        '//Thirdparty/RxSwift:RxRelay',
        '//Home:Home',
        '//Thirdparty/RIBs:RIBs',
        '//Home:Interfaces',
        '//Root:Interfaces',
        '//App:App_Classes',
        '//Thirdparty/RxSwift:RxSwift',
        '//Root:Root',
        '//App:ios_app',
    ]),
    BazelFlagsSet(
        debug = BazelFlags(
            startup = [],
            build = [
                '--override_repository=tulsi=/Users/nguyenmanh/Library/Application Support/Tulsi/0.20210318.88/Bazel',
                '--compilation_mode=dbg',
                '--define=apple.add_debugger_entitlement=1',
                '--define=apple.propagate_embedded_extra_outputs=1',
            ],
        ),
        release = BazelFlags(
            startup = [],
            build = [
                '--override_repository=tulsi=/Users/nguyenmanh/Library/Application Support/Tulsi/0.20210318.88/Bazel',
                '--compilation_mode=opt',
                '--strip=always',
                '--apple_generate_dsym',
                '--define=apple.add_debugger_entitlement=1',
                '--define=apple.propagate_embedded_extra_outputs=1',
            ],
        ),
    ),
    BazelFlagsSet(
        flags = BazelFlags(
            startup = [],
            build = [
                '--announce_rc',
            ],
        ),
    ),
    BazelFlagsSet(
        flags = BazelFlags(
            startup = [],
            build = [
                '--define=apple.experimental.tree_artifact_outputs=1',
                '--features=debug_prefix_map_pwd_is_dot',
            ],
        ),
    ),
    BazelFlagsSet(
        flags = BazelFlags(
            startup = [],
            build = [
                '--define=apple.experimental.tree_artifact_outputs=1',
                '--features=debug_prefix_map_pwd_is_dot',
            ],
        ),
    ),
    [
        'TreeArtifactOutputs',
        'DebugPathNormalization',
    ],
    [
        'TreeArtifactOutputs',
        'DebugPathNormalization',
    ],
    BazelFlagsSet(),
    {},
)

