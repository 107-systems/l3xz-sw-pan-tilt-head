from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
  return LaunchDescription([
    Node(
      package='l3xz_openmv_camera',
      executable='l3xz_openmv_camera',
      name='openmv_rgb',
      namespace='l3xz',
      output='screen',
      parameters=[
          {'image_topic': 'image_color'},
          {'image_queue': 1},
          {'info_topic': 'camera_info'},
          {'info_queue': 1},
          {'show_image' : False},
          {'port': '/dev/serial/by-id/usb-OpenMV_OpenMV_Virtual_Comm_Port_in_FS_Mode_387C357D3330-if00'},
          {'frames_hz': 10},
          {'gpio_hz': 1},
          {'frame_id': 'openmv_camera_link'},
          {'resolution': 'QVGA'}
      ]
    ),
    
    Node(
      package='l3xz_openmv_camera',
      executable='l3xz_openmv_camera',
      name='openmv_thermal',
      namespace='l3xz',
      output='screen',
      parameters=[
          {'image_topic': 'image_color'},
          {'image_queue': 1},
          {'info_topic': 'camera_info'},
          {'info_queue': 1},
          {'show_image' : False},
          {'port': '/dev/serial/by-id/usb-OpenMV_OpenMV_Virtual_Comm_Port_in_FS_Mode_3172326E3330-if00'},
          {'frames_hz': 10},
          {'gpio_hz': 1},
          {'frame_id': 'openmv_camera_link'},
          {'resolution': 'QVGA'}
      ]
    ),

    Node(package = "tf2_ros",
         executable = "static_transform_publisher",
         name="base_link_to_openmv_camera_link",
         namespace='l3xz',
         output='screen',
         arguments = ["0", "0", "0", "0", "0", "0", "base_link", "openmv_camera_link"]
    )
  ])
