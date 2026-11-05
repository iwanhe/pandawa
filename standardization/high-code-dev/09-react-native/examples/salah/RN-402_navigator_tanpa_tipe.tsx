// SALAH — diadaptasi dari src/screen/navigation/mainNavigation.tsx di boilerplate.
// Melanggar: RN-402 (param list any), RN-401 (paket react-navigation lama), JS-610 (import tidak
// dipakai), JS-702 (default export).
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { createAppContainer } from 'react-navigation';
import { Text } from 'react-native';

const Stack = createNativeStackNavigator<any>();

function InboundList() {
  return <Text>Inbound</Text>;
}

const MainNavigator = () => (
  <Stack.Navigator screenOptions={{ headerShown: false }} initialRouteName="InboundList">
    <Stack.Screen name="InboundList" component={InboundList} />
  </Stack.Navigator>
);

export default MainNavigator;
