#include <gtest/gtest.h>
#include <MelechDsp/PluginProcessor.h> // This is the header file for the class we are testing

namespace audio_plugin_test {
    TEST (AudioPluginAudioProcessor, Foo){
        AudioPluginAudioProcessor processor{};
        ASSERT_FALSE(true);
 }
 }
 
    namespace audio_plugin_test
    {
        TEST(AudioPluginAudioProcessor, Foo)
        {
            AudioPluginAudioProcessor processor{};
            ASSERT_FALSE(true);
        }
    }
